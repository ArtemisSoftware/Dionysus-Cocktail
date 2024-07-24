import 'package:dionysus_cocktail/presentation/bookmark/bookmark_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../di/app_module.dart';
import '../../domain/models/drink.dart';
import '../home/widget/cocktail_card_widget.dart';
import 'bookmark_bloc.dart';
import 'bookmark_state.dart';

class Bookmark extends HookWidget {
  const Bookmark({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BookmarkBloc>()..add(const GetSavedDrinks()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is DrinksDone) {
          return _buildArticlesList(state.drinks);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<Drink> drinks) {
    if (drinks.isEmpty) {
      return const Center(
          child: Text(
            'NO SAVED ARTICLES',
            style: TextStyle(color: Colors.black),
          ));
    }

    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return CocktailCardWidget(
          drink: drinks[index],
          // isRemovable: true,
          // onRemove: (article) => _onRemoveDrink(context, article),
          onDrinkPressed: (drink) => _onDrinkPressed(context, drink),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveDrink(BuildContext context, Drink article) {
    BlocProvider.of<BookmarkBloc>(context).add(RemoveDrink(article));
  }

  void _onDrinkPressed(BuildContext context, Drink article) {
    Navigator.pushNamed(context, '/Details', arguments: article);
  }
}