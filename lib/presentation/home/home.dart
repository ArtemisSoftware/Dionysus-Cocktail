
import 'package:dionysus_cocktail/presentation/home/home_bloc.dart';
import 'package:dionysus_cocktail/presentation/home/home_state.dart';
import 'package:dionysus_cocktail/presentation/home/widget/cocktail_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/appbar/top_bar.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar('Cocktail List'),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<HomeBloc,HomeState> (
      builder: (_,state) {

        switch (state.runtimeType) {
          case Loading:
            return const Center(child: CupertinoActivityIndicator());

          case Error:
            return const Center(child: Icon(Icons.refresh));

          case RemoteDrinksDone:
            return ListView.builder(
              itemBuilder: (context,index){
                return CocktailCardWidget(
                  drink: state.drinks[index] ,
                  // onArticlePressed: (article) => _onArticlePressed(context,article),
                );
              },
              itemCount: state.drinks.length,
            );
        }
        return const SizedBox();
      },
    );
  }
/*
  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
*/
}