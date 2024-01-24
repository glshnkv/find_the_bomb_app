class LevelModel {
  final int number;
  final int gridSize;
  final double gridWidth;
  final List<String> cardImages;
  bool isDone;

  LevelModel(
      {required this.cardImages,
      required this.gridSize,
      required this.isDone,
      required this.gridWidth,
      required this.number});
}
