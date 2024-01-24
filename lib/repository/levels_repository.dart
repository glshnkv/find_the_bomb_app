import 'package:find_the_bomb_app/models/level_model.dart';

class LevelsRepository {
  final List<LevelModel> _list = [
    LevelModel(number: 1, gridSize: 2, isDone: false, cardImages: [
      'assets/images/game/bomb.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png'
    ], gridWidth: 250),
    LevelModel(number: 2, gridSize: 3, isDone: false, cardImages: [
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png'
    ], gridWidth: 350),
    LevelModel(number: 3, gridSize: 4, isDone: false, cardImages: [
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
    ], gridWidth: 450),
    LevelModel(number: 4, gridSize: 5, isDone: false, cardImages: [
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
    ], gridWidth: 550),
    LevelModel(number: 5, gridSize: 6, isDone: false, cardImages: [
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/bomb.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
      'assets/images/game/empty.png',
    ], gridWidth: 650),
  ];

  List<LevelModel> get getSimpleLevels => _list;
}
