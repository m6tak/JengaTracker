import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jenga/data/color_scheme.dart';
import 'package:jenga/views/base/base_button.dart';

class MainMenu extends StatefulWidget{

  final Map<Widget, Function> options;
  final int players;
  final Function addPlayer, removePlayer;
  MainMenu({this.options, this.players, this.addPlayer, this.removePlayer});

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>{
  

  

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.add, color: JengaColorScheme.primaryOrange), iconSize: 40, onPressed: widget.addPlayer),
              Icon(Icons.person, size: 50),
              Text(
                "${widget.players}",
                style: TextStyle(
                  fontSize: 40
                )
              ),
              IconButton(icon: Icon(Icons.remove, color: JengaColorScheme.primaryOrange), iconSize: 40, onPressed: widget.removePlayer)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.options.entries.map((o) => BaseButton(
              child: o.key,
              action: o.value,
              width: 150.0 ,
              height: 100.0 ,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
            )).toList()
          )
        ],
      )
    );
  }

}