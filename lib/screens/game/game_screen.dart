import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/models/card_model.dart';

// import 'package:find_the_bomb_app/models/game_model.dart';
import 'package:find_the_bomb_app/models/level_model.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/screens/game/widgets/card_widget.dart';
import 'package:find_the_bomb_app/screens/levels/levels_screen.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/screens/game/widgets/card_widget.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  final LevelModel level;

  const GameScreen({
    super.key,
    required this.level,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Duration duration;

  @override
  void initState() {
    super.initState();
    duration = const Duration();
    generateCards();
  }

  int _health = 3;
  List<CardModel> cards = [];
  bool isGameOver = false;
  Set<String> images = {};

  void _decrementHealth() {
    setState(() {
      _health--;
    });
  }

  void generateCards() {
    cards = [];
    for (int i = 0; i < widget.level.cardImages.length; i++) {
      final cardValue = i + 1;
      final String image = widget.level.cardImages[i];
      final CardModel newCard = _createCardModel(image, cardValue);
      cards.add(newCard);
    }
    cards.shuffle(Random());
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }


  void onCardPressed(int index) {
    setState(() {
      cards[index].state = CardState.visible;
    });
    if (cards[index].image == 'assets/images/game/empty.png') {
      _decrementHealth();
      if (_health == 0) {
        context.router.popAndPush(EndGameRoute(level: widget.level, health: _health));
      }
    } else {
      cards[index].state = CardState.guessed;
      isGameOver = _isGameOver();
      if (isGameOver) {
        Future.delayed(const Duration(seconds: 1), () {
          widget.level.isDone = true;
          context.router.popAndPush(EndGameRoute(level: widget.level, health: _health));
        });
      }
    }
  }

  CardModel _createCardModel(String image, int cardValue) {
    return CardModel(
      value: cardValue,
      image: image,
    );
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    List<CardModel> _checkCards = [];
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].image == 'assets/images/game/bomb.png') {
        _checkCards.add(cards[i]);
      }
    }
    return _checkCards.every((card) => card.state == CardState.guessed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/elements/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: StrokeTextWidget(
                        text: 'Lvl ${widget.level.number}',
                        strokeColor: AppColors.blue,
                        fontSize: 32,),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: widget.level.gridWidth,
                    height: 250,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: cards.length,
                      padding: EdgeInsets.zero,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: widget.level.gridSize),
                      itemBuilder: (BuildContext context, int index) {
                        return CardWidget(
                          index: index,
                          card: cards[index],
                          onCardPressed: onCardPressed,
                        );
                      },
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.popAndPush(SettingsRoute());
                        },
                        child: SvgPicture.asset(
                            'assets/images/elements/settings-button.svg'),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          context.router.popAndPush(LevelsRoute());
                        },
                        child: SvgPicture.asset(
                            'assets/images/elements/home-button.svg'),
                      ),
                      SizedBox(height: 15),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/images/elements/health.svg'),
                          StrokeTextWidget(text: '${_health}x', strokeColor: AppColors.blue, fontSize: 32),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
