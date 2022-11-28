import 'package:engklek_game/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';

class Text1 extends TextComponent with HasGameRef<EngklekGame> {
  Text1({
    String? text,
    TextRenderer? textRenderer,
    Vector2? position,
  }) : super(text: text, textRenderer: textRenderer, position: position);
}
