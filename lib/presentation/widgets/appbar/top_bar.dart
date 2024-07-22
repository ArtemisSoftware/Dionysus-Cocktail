
import 'package:flutter/material.dart';

AppBar topBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black
      ),
    ),
    // actions: [
    //   GestureDetector(
    //     onTap: () => _onShowSavedArticlesViewTapped(context),
    //     child: const Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 14),
    //       child: Icon(Icons.bookmark, color: Colors.black),
    //     ),
    //   ),
    // ],
  );
}
