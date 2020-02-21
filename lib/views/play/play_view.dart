import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/models/play_screen/play_view_model.dart';
import 'package:jenga/views/play/game_interface.dart';
import 'package:jenga/views/play/game_summary.dart';

class PlayView extends StatefulWidget{
  final int players;
  PlayView({this.players});
  @override
  State<StatefulWidget> createState() => _PlayViewState(players);
}

class _PlayViewState extends State<PlayView>{
  _PlayViewState(int players){
    _playViewModel = PlayViewModel(players);
    _gameOver = false;
  }
  
  PlayViewModel _playViewModel;
  bool _gameOver;

  void move(){
    setState(() {
      _playViewModel.move();
    });
  }

  void gameOver(){
    setState(() {
      _playViewModel.end();
      _gameOver = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JengaColorScheme.primaryWhite,
      appBar: AppBar(
        title: Center(
          child: Text(
            "JENGA",
            style: TextStyle(
              color: JengaColorScheme.primaryWhite,
              fontSize: 20,
              fontFamily: 'ActionComics'
            ),
          )
        )
      ),
      body: !_gameOver ? GameInterface(
        currentPlayer: _playViewModel.currentPlayer,
        move: move,
        gameOver: gameOver,
      ) 
      : GameSummary(
        stats: _playViewModel.stats, 
        looser: _playViewModel.currentPlayer
      )
    );
  }
}