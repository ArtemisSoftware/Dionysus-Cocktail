import 'package:dionysus_cocktail/data/network/cocktail_api.dart';
import 'package:dionysus_cocktail/domain/repository/drink_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../data/database/app_database.dart';
import '../data/repository/drink_repository_impl.dart';
import '../domain/usecases/get_drinks_use_case.dart';
import '../presentation/home/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Network
  sl.registerSingleton<CocktailApi>(CocktailApi(sl()));

  // Database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Repository
  sl.registerSingleton<DrinkRepository>(
      DrinkRepositoryImpl(sl()/*,sl()*/)
  );

  //UseCases
  sl.registerSingleton<GetDrinksUseCase>(
      GetDrinksUseCase(sl())
  );
/*
  sl.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(sl())
  );

  sl.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(sl())
  );
*/

  //Blocs
  sl.registerFactory<HomeBloc>(
          ()=> HomeBloc(sl())
  );
/*
  sl.registerFactory<LocalArticleBloc>(
          ()=> LocalArticleBloc(sl(),sl(),sl())
  );
*/

}