import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';

class StatsTile extends StatelessWidget{

  StatsTile({this.gameNo, this.game});

  final int gameNo;
  final Map<String, dynamic> game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          title: Row(
            children: <Widget>[
              Text(
                "#$gameNo         Moves: ${game["moves"]}          Floors: ${game["floors"]}",
                style: TextStyle(
                  fontFamily: "vct",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: JengaColorScheme.primaryDark
                )
              ),
            ],
          ),
          trailing: Container(
            width: 50,
            child: Row(
              children: <Widget>[
                Icon(Icons.person),
                Text(
                  "${game["players"]}",
                  style: TextStyle(
                    fontFamily: "vct",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: JengaColorScheme.primaryDark
                  )
                )
              ],
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
          child: Divider(
            color: JengaColorScheme.primaryOrange,
            thickness: 1,
          ),
        )
        
      ]
    );
  }

}