import 'dart:convert';
import 'dart:io';
import 'package:jenga/models/base/game_stats_model.dart';
import 'package:path_provider/path_provider.dart';class 

DataStore {
  static final DataStore _singleton = DataStore._internal();

  List<dynamic> _games;
  int _totalGamesPlayed;

  factory DataStore() {
    return _singleton;
  }

  DataStore._internal();

  Future<String> get _localPath async{
    return (await getApplicationDocumentsDirectory()).path;
  }

  Future<File> get _storeFile async{
    var path = await _localPath;
    return File("$path/store.json");
  }

  Future load() async {
    try{
      var dataStoreEncoded = await (await _storeFile).readAsString();
      if(dataStoreEncoded.isEmpty) throw Exception();
      Map<String, dynamic> ds = jsonDecode(dataStoreEncoded);
      _games = ds["games"];
      _totalGamesPlayed = ds["totalGamesPlayed"];
    }
    catch(e){
      print(e.toString());
      _games = List<dynamic>();
      _totalGamesPlayed = 0;
    }
  }

  Future commit() async {
    var dataEncoded = jsonEncode(
      {
        "games": _games,
        "totalGamesPlayed": _totalGamesPlayed
      }
    );
    await (await _storeFile).writeAsString(dataEncoded);
  }

  GameStats game(int index) => _games[index];
  List<dynamic> get gameHistory => _games;

  void addGame(dynamic game){
    _games.add({
      "moves": game.moves,
      "floors": game.floors,
      "players": game.players
    });
    _totalGamesPlayed+=1;
    commit();
  }
}