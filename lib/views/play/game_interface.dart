import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/views/base/base_button.dart';

class GameInterface extends StatelessWidget{
  GameInterface({this.currentPlayer, this.move, this.gameOver});

  final int currentPlayer;
  final Function move;
  final Function gameOver;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 50,
              ),
              Text(
                "$currentPlayer",
                style: TextStyle(
                  color: JengaColorScheme.secondaryDark,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          BaseButton(
            child: Icon(Icons.fast_forward, size: 60, color: JengaColorScheme.primaryWhite),
            action: move,
            width: 250.0,
            height: 150.0,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(20),
          ),
          BaseButton(
            child: Text(
              "GAME OVER",
              style: TextStyle(
                fontFamily: 'vct',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: JengaColorScheme.primaryWhite,
                letterSpacing: 5
              )
            ),
            action: gameOver,
            width: 250.0,
            height: 50.0,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(20),
          ),
        ]
      )
    );
  }

}