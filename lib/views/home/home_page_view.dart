import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/views/home/main_menu.dart';
import 'package:jenga/views/play/play_view.dart';
import 'package:jenga/views/stats/stats_view.dart';

class JengaHomePage extends StatefulWidget{
  final String title;

  JengaHomePage({this.title});

  @override
  _JengaHomePageState createState() => _JengaHomePageState();

}

class _JengaHomePageState extends State<JengaHomePage>{
  _JengaHomePageState(){
    _players = 1;
  }

  int _players;

  void addPlayer(){
    setState(() {
      _players += 1;
    });
  }

  void removePlayer(){
    setState(() {
      _players = _players > 1 ? _players - 1 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JengaColorScheme.primaryWhite,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: JengaColorScheme.primaryWhite,
              fontSize: 20,
              fontFamily: 'ActionComics'
            ),
          )
        )
      ),
      body: MainMenu(
        options: {
          Center(child: Icon(Icons.play_arrow, size: 60, color: JengaColorScheme.primaryWhite)): () {
            print("$_players");
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PlayView(players: _players))
            );
          },
          Icon(Icons.score, size: 60, color: JengaColorScheme.primaryWhite): () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StatsView())
            );
          }
        },
        players: _players,
        addPlayer: addPlayer,
        removePlayer: removePlayer,
      )
    );
  }
}