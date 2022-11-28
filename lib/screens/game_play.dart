import 'dart:developer';

import 'package:engklek_game/widgets/game_over_menu.dart';
import 'package:engklek_game/widgets/game_win_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game/game.dart';

class GamePlay extends StatefulWidget {
  final int? difficulty;

  const GamePlay(
    this.difficulty, {
    Key? key,
  }) : super(key: key);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  EngklekGame? _engklekGame;

  @override
  void initState() {
    _engklekGame = EngklekGame(widget.difficulty!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: _engklekGame!,
          initialActiveOverlays: const [],
          overlayBuilderMap: {
            GameOverMenu.ID: (BuildContext context, EngklekGame gameref) =>
                GameOverMenu(gameref),
            GameWinMenu.ID: (BuildContext context, EngklekGame gameref) =>
                GameWinMenu(gameref),
          },
        ),
      ),
    );
  }
}
