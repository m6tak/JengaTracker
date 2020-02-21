import 'package:flutter/material.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/data/data_store.dart';
import 'package:jenga/views/stats/stats_tile.dart';

class StatsView extends StatefulWidget {
   @override
  State<StatefulWidget> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView>{
  
  _StatsViewState(){
    _games = DataStore().gameHistory;
  }

  List<dynamic> _games;

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 2,
        child: ListView.builder(
            itemCount: _games.length,
            itemBuilder: (BuildContext context, int index) {
              var game = _games[index];
              return StatsTile(
                gameNo: index + 1,
                game: game
              );
            }
          )
        )
      );
  }
}