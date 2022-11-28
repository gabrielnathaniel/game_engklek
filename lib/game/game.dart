import 'package:engklek_game/game/background.dart';
import 'package:engklek_game/game/button1.dart';
import 'package:engklek_game/game/button2.dart';
import 'package:engklek_game/game/button3.dart';
import 'package:engklek_game/game/button_text1.dart';
import 'package:engklek_game/game/button_text2.dart';
import 'package:engklek_game/game/button_text3.dart';
import 'package:engklek_game/game/clicked_button1.dart';
import 'package:engklek_game/game/clicked_button2.dart';
import 'package:engklek_game/game/clicked_button3.dart';
import 'package:engklek_game/game/clicked_text1.dart';
import 'package:engklek_game/game/clicked_text2.dart';
import 'package:engklek_game/game/clicked_text3.dart';
import 'package:engklek_game/game/player.dart';
import 'package:engklek_game/game/text1.dart';
import 'package:engklek_game/game/text2.dart';
import 'package:engklek_game/game/text3.dart';
import 'package:engklek_game/game/timer_text.dart';
import 'package:engklek_game/game/word1.dart';
import 'package:engklek_game/game/word2.dart';
import 'package:engklek_game/game/word3.dart';
import 'package:engklek_game/widgets/game_over_menu.dart';
import 'package:engklek_game/widgets/game_win_menu.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EngklekGame extends FlameGame with HasTappables {
  late Player slamet1;
  late Background background;
  late Button1 button1;
  late Button2 button2;
  late Button3 button3;
  late ClickedButton1 clickedButton1;
  late ClickedButton2 clickedButton2;
  late ClickedButton3 clickedButton3;
  late Word1 word1;
  late Word2 word2;
  late Word3 word3;
  late Text1 text1;
  late Text2 text2;
  late Text3 text3;
  late ButtonText1 buttonText1;
  late ButtonText2 buttonText2;
  late ButtonText3 buttonText3;
  late ClickedText1 clickedText1;
  late ClickedText2 clickedText2;
  late ClickedText3 clickedText3;
  late TimerText timerText;

  late Timer countDown;
  late int remainingTime = 10;

  int stage = 1;
  int correct = 0;
  int turn = 1;
  int wrong = 0;

  List<String> charList = ['A', 'B', 'C'];

  int difficulty;

  EngklekGame(this.difficulty);

  @override
  Future<void>? onLoad() async {
    await images.load('background1.png');
    await images.load('background2.png');
    await images.load('background3.png');
    await images.load('background4.png');
    await images.load('background5.png');
    await images.load('background6.png');
    await images.load('background7.png');
    await images.load('button.png');
    await images.load('word.png');
    await images.load('correct.png');
    await images.load('clicked.png');
    await images.load('slamet1.png');
    await images.load('slamet2.png');
    await images.load('slamet3.png');

    background = Background(
      sprite: await loadSprite('background1.png'),
      size: Vector2(size.x, size.y),
    );

    slamet1 = Player(
      sprite: await loadSprite('slamet1.png'),
      size: Vector2(114, 176),
      position: Vector2(size.x / 2, size.y * (4.5 / 7)),
      anchor: Anchor.center,
    );

    word1 = Word1(
      button: await loadSprite('word.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (1 / 5) - 45, size.y * (1 / 12)),
      onPressed: () {},
    );
    word2 = Word2(
      button: await loadSprite('word.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x / 2 - 45, size.y * (1 / 12)),
      onPressed: () {},
    );
    word3 = Word3(
      button: await loadSprite('word.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (4 / 5) - 45, size.y * (1 / 12)),
      onPressed: () {},
    );

    button1 = Button1(
      button: await loadSprite('button.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (1 / 5) - 45, size.y * (6 / 7)),
      onPressed: () {},
    );
    button2 = Button2(
      button: await loadSprite('button.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x / 2 - 45, size.y * (6 / 7)),
      onPressed: () {},
    );
    button3 = Button3(
      button: await loadSprite('button.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (4 / 5) - 45, size.y * (6 / 7)),
      onPressed: () {},
    );
    clickedButton1 = ClickedButton1(
      button: await loadSprite('clicked.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (1 / 5) - 45, size.y * (6 / 7)),
      onPressed: () {},
    );
    clickedButton2 = ClickedButton2(
      button: await loadSprite('clicked.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x / 2 - 45, size.y * (6 / 7)),
      onPressed: () {},
    );
    clickedButton3 = ClickedButton3(
      button: await loadSprite('clicked.png'),
      size: Vector2(90, 84),
      position: Vector2(size.x * (4 / 5) - 45, size.y * (6 / 7)),
      onPressed: () {},
    );

    text1 = Text1(
      text: 'A',
      textRenderer: TextPaint(style: const TextStyle(fontSize: 50)),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (1 / 5) - 16, size.y * (1 / 12) + 14),
    );
    text2 = Text2(
      text: 'B',
      textRenderer: TextPaint(style: const TextStyle(fontSize: 50)),
      // size: Vector2(100, 60),
      position: Vector2(size.x / 2 - 16, size.y * (1 / 12) + 14),
    );
    text3 = Text3(
      text: 'C',
      textRenderer: TextPaint(style: const TextStyle(fontSize: 50)),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (4 / 5) - 16, size.y * (1 / 12) + 14),
    );

    buttonText1 = ButtonText1(
      text: 'A',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (1 / 5) - 16, size.y * (6 / 7) + 14),
    );
    buttonText2 = ButtonText2(
      text: 'B',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x / 2 - 16, size.y * (6 / 7) + 14),
    );
    buttonText3 = ButtonText3(
      text: 'C',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (4 / 5) - 16, size.y * (6 / 7) + 14),
    );

    clickedText1 = ClickedText1(
      text: 'A',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (1 / 5) - 16, size.y * (6 / 7) + 14),
    );
    clickedText2 = ClickedText2(
      text: 'B',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x / 2 - 16, size.y * (6 / 7) + 14),
    );
    clickedText3 = ClickedText3(
      text: 'C',
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 50, color: Color(0xFF553A19))),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (4 / 5) - 16, size.y * (6 / 7) + 14),
    );

    countDown = Timer(1, onTick: () {
      if (remainingTime > 0) {
        remainingTime -= 1;
        print(remainingTime);
      }
    }, repeat: true);

    timerText = TimerText(
      text: remainingTime.toString(),
      textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white)),
      // size: Vector2(100, 60),
      position: Vector2(size.x * (1 / 8) - 14, size.y * (2 / 12) + 30),
    );

    if (difficulty == 1) {
      remainingTime = 5;
    }
    if (difficulty == 2) {
      remainingTime = 4;
    }
    if (difficulty == 3) {
      remainingTime = 3;
    }

    add(background);
    add(slamet1);
    add(button1);
    add(button2);
    add(button3);
    add(word1);
    add(word2);
    add(word3);
    add(text1);
    add(text2);
    add(text3);
    add(buttonText1);
    add(buttonText2);
    add(buttonText3);
    add(timerText);
  }

  void start() {
    text1.text = 'C';
    text2.text = 'A';
    text3.text = 'B';
    buttonText1.text = 'A';
    buttonText2.text = 'B';
    buttonText3.text = 'C';
    if (turn == 1) {
      button1.onPressed = () async {
        if (buttonText1.text == text1.text) {
          turn += 1;
          correct += 1;
          add(clickedButton1);
          clickedText1.text = buttonText1.text;
          add(clickedText1);
          text1.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText1.text != text1.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button2.onPressed = () {
        if (buttonText2.text == text1.text) {
          turn += 1;
          correct += 1;
          add(clickedButton2);
          clickedText2.text = buttonText2.text;
          add(clickedText2);
          text1.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText2.text != text1.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button3.onPressed = () async {
        if (buttonText3.text == text1.text) {
          turn += 1;
          correct += 1;
          add(clickedButton3);
          clickedText3.text = buttonText3.text;
          add(clickedText3);
          text1.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText3.text != text1.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
    }
    if (turn == 2) {
      button1.onPressed = () {
        if (buttonText1.text == text2.text) {
          turn += 1;
          correct += 1;
          add(clickedButton1);
          clickedText1.text = buttonText1.text;
          add(clickedText1);
          text2.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText1.text != text2.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button2.onPressed = () {
        if (buttonText2.text == text2.text) {
          turn += 1;
          correct += 1;
          add(clickedButton2);
          clickedText2.text = buttonText2.text;
          add(clickedText2);
          text2.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText2.text != text2.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button3.onPressed = () {
        if (buttonText3.text == text2.text) {
          turn += 1;
          correct += 1;
          add(clickedButton3);
          clickedText3.text = buttonText3.text;
          add(clickedText3);
          text2.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText3.text != text2.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
    }
    if (turn == 3) {
      button1.onPressed = () {
        if (buttonText1.text == text3.text) {
          turn += 1;
          correct += 1;
          add(clickedButton1);
          clickedText1.text = buttonText1.text;
          add(clickedText1);
          text3.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText1.text != text3.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button2.onPressed = () {
        if (buttonText2.text == text3.text) {
          turn += 1;
          correct += 1;
          add(clickedButton2);
          clickedText2.text = buttonText2.text;
          add(clickedText2);
          text3.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText2.text != text3.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
      button3.onPressed = () async {
        if (buttonText3.text == text3.text) {
          turn += 1;
          correct += 1;
          add(clickedButton3);
          clickedText3.text = buttonText3.text;
          add(clickedText3);
          text3.textRenderer = TextPaint(
              style: const TextStyle(fontSize: 50, color: Colors.green));
          print(turn);
          print(correct);
        } else if (buttonText3.text != text3.text) {
          pauseEngine();
          overlays.add(GameOverMenu.ID);
        }
      };
    }
    if (remainingTime == 0) {
      pauseEngine();
      overlays.add(GameOverMenu.ID);
    }
    if (correct == 3) {
      reset();
      stage += 1;
    }
  }

  void reset() {
    correct = 0;
    turn = 1;
    if (difficulty == 1) {
      remainingTime = 5;
    }
    if (difficulty == 2) {
      remainingTime = 4;
    }
    if (difficulty == 3) {
      remainingTime = 3;
    }
    remove(clickedButton1);
    remove(clickedText1);
    remove(clickedButton2);
    remove(clickedText2);
    remove(clickedButton3);
    remove(clickedText3);
    text1.textRenderer =
        TextPaint(style: const TextStyle(fontSize: 50, color: Colors.white));
    text2.textRenderer =
        TextPaint(style: const TextStyle(fontSize: 50, color: Colors.white));
    text3.textRenderer =
        TextPaint(style: const TextStyle(fontSize: 50, color: Colors.white));
  }

  @override
  Future<void> update(double dt) async {
    start();
    if (remainingTime > 0) {
      countDown.update(dt);
    }
    timerText.text = remainingTime.toString();
    double _speed = 50;
    if (stage == 2) {
      background.sprite = await loadSprite('background2.png');
      text1.text = 'B';
      text2.text = 'C';
      text3.text = 'A';
      buttonText1.text = 'C';
      buttonText2.text = 'A';
      buttonText3.text = 'B';
      if (slamet1.position.y > size.y * (3.6 / 7) - 1) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
      }
    }
    if (stage == 3) {
      text1.text = 'A';
      text2.text = 'B';
      text3.text = 'C';
      buttonText1.text = 'B';
      buttonText2.text = 'A';
      buttonText3.text = 'C';
      background.sprite = await loadSprite('background3.png');
      if (slamet1.position.y > size.y * (3 / 7) - 1) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
      }
    }
    if (stage == 4) {
      text1.text = 'C';
      text2.text = 'A';
      text3.text = 'B';
      buttonText1.text = 'C';
      buttonText2.text = 'B';
      buttonText3.text = 'A';
      background.sprite = await loadSprite('background4.png');
      if (slamet1.position.y > size.y * (2.5 / 7) - 1) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
        Future.delayed(const Duration(milliseconds: 800)).then((value) async {
          slamet1.sprite = await loadSprite('slamet2.png');
        });
      }
    }
    if (stage == 5) {
      text1.text = 'A';
      text2.text = 'C';
      text3.text = 'B';
      buttonText1.text = 'C';
      buttonText2.text = 'B';
      buttonText3.text = 'A';
      background.sprite = await loadSprite('background5.png');
      if (slamet1.position.y > size.y * (2.1 / 7) - 1) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
        Future.delayed(const Duration(milliseconds: 800)).then((value) async {
          slamet1.sprite = await loadSprite('slamet1.png');
        });
      }
    }
    if (stage == 6) {
      text1.text = 'B';
      text2.text = 'A';
      text3.text = 'C';
      buttonText1.text = 'A';
      buttonText2.text = 'C';
      buttonText3.text = 'B';
      background.sprite = await loadSprite('background6.png');
      if (slamet1.position.y > size.y * (1.7 / 7)) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
        Future.delayed(const Duration(milliseconds: 800)).then((value) async {
          slamet1.sprite = await loadSprite('slamet2.png');
        });
      }
    }
    if (stage == 7) {
      text1.text = 'A';
      text2.text = 'C';
      text3.text = 'B';
      buttonText1.text = 'C';
      buttonText2.text = 'B';
      buttonText3.text = 'A';
      background.sprite = await loadSprite('background8.png');
      if (slamet1.position.y > size.y * (1.3 / 7)) {
        slamet1.position += Vector2(0, -1) * _speed * dt;
        Future.delayed(const Duration(milliseconds: 1000)).then((value) async {
          slamet1.sprite = await loadSprite('slamet3.png');
          // background.sprite = await loadSprite('background8.png');
        });
      }
    }
    if (stage == 8) {
      text1.text = 'B';
      text2.text = 'C';
      text3.text = 'A';
      buttonText1.text = 'A';
      buttonText2.text = 'B';
      buttonText3.text = 'C';
      slamet1.sprite = await loadSprite('slamet4.png');
      background.sprite = await loadSprite('background9.png');
      if (slamet1.position.y < size.y * (1.7 / 7)) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
    }
    if (stage == 9) {
      text1.text = 'C';
      text2.text = 'B';
      text3.text = 'A';
      buttonText1.text = 'C';
      buttonText2.text = 'A';
      buttonText3.text = 'B';
      slamet1.sprite = await loadSprite('slamet3.png');
      background.sprite = await loadSprite('background10.png');
      if (slamet1.position.y < size.y * (2.1 / 7) + 1) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
    }
    if (stage == 10) {
      text1.text = 'A';
      text2.text = 'C';
      text3.text = 'B';
      buttonText1.text = 'A';
      buttonText2.text = 'B';
      buttonText3.text = 'C';
      slamet1.sprite = await loadSprite('slamet4.png');
      background.sprite = await loadSprite('background11.png');
      if (slamet1.position.y < size.y * (2.5 / 7) + 1) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
    }
    if (stage == 11) {
      text1.text = 'A';
      text2.text = 'B';
      text3.text = 'C';
      buttonText1.text = 'B';
      buttonText2.text = 'A';
      buttonText3.text = 'C';
      slamet1.sprite = await loadSprite('slamet3.png');
      background.sprite = await loadSprite('background12.png');
      if (slamet1.position.y < size.y * (3 / 7) + 1) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
    }
    if (stage == 12) {
      text1.text = 'B';
      text2.text = 'C';
      text3.text = 'A';
      buttonText1.text = 'A';
      buttonText2.text = 'B';
      buttonText3.text = 'C';
      background.sprite = await loadSprite('background13.png');
      if (slamet1.position.y < size.y * (3.6 / 7) + 1) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
    }
    if (stage == 13) {
      text1.text = 'Y';
      text2.text = 'O';
      text3.text = 'U';
      buttonText1.text = 'W';
      buttonText2.text = 'O';
      buttonText3.text = 'N';
      button1.onPressed = () {};
      button2.onPressed = () {};
      button3.onPressed = () {};
      timerText.text = '';
      background.sprite = await loadSprite('background14.png');
      if (slamet1.position.y < size.y * (4.5 / 7)) {
        slamet1.position += Vector2(0, 1) * _speed * dt;
      }
      Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
        pauseEngine();
        overlays.add(GameWinMenu.ID);
      });
    }

    super.update(dt);
  }
}
