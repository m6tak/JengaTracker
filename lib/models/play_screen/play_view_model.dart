import 'package:jenga/data/data_store.dart';
import 'package:jenga/models/base/game_stats_model.dart';

class PlayViewModel {
  PlayViewModel(int players){
    stats = GameStats(players);
    currentPlayer = 1;
  }
  
  GameStats stats;
  int currentPlayer;

  void move(){
    stats.moves += 1;
    stats.floors = stats.moves ~/ 3;
    currentPlayer = currentPlayer >= stats.players ? 1 : currentPlayer + 1;
  }

  void end(){
    DataStore().addGame(stats);
  }
}