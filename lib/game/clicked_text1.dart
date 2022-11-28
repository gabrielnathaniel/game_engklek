import 'package:engklek_game/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';

class ClickedText1 extends TextComponent with HasGameRef<EngklekGame> {
  ClickedText1({
    String? text,
    TextRenderer? textRenderer,
    Vector2? position,
  }) : super(text: text, textRenderer: textRenderer, position: position);
}
