import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/models/base/game_stats_model.dart';

class GameSummary extends StatelessWidget{
  GameSummary({this.stats, this.looser});
  
  final GameStats stats;
  final int looser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          Text(
            "LOOSER: $looser",
            style: TextStyle(
              color: JengaColorScheme.secondaryDark,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "vct"
            ),
          ),
          SizedBox(height: 15),
          Text(
            "TOTAL MOVES: ${stats.moves}",
            style: TextStyle(
              color: JengaColorScheme.secondaryDark,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "vct"
            ),
          ),
          SizedBox(height: 15),
          Text(
            "TOTAL FLOORS: ${stats.floors}",
            style: TextStyle(
              color: JengaColorScheme.secondaryDark,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "vct"
            ),
          )
        ]
      )
    );
  }
}