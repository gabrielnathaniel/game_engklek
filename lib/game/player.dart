import 'package:engklek_game/game/game.dart';
import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef<EngklekGame> {
  Player({
    Sprite? sprite,
    Vector2? size,
    Vector2? position,
    Anchor? anchor,
  }) : super(sprite: sprite, size: size, position: position, anchor: anchor);
}
