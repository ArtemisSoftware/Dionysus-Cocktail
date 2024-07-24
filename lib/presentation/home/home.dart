
import 'package:dionysus_cocktail/domain/models/drink.dart';
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
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Cocktail List',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedDrinksTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: Colors.black),
          ),
        ),
      ],
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
                  onDrinkPressed: (drink) => _onDrinkPressed(context, drink),
                );
              },
              itemCount: state.drinks.length,
            );
        }
        return const SizedBox();
      },
    );
  }

  void _onDrinkPressed(BuildContext context, Drink drink) {
    Navigator.pushNamed(context, '/Details', arguments: drink);
  }

  void _onShowSavedDrinksTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedDrinks');
  }

}