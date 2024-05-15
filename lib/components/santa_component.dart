import 'package:flame/components.dart';
import '../constants/globals.dart';
import '../game/gift_grab_game.dart';

class SantaComponent extends SpriteComponent with HasGameRef<GiftGrabGame>{
  final double _spriteHeight = 200;

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.santaIdleSprite);
    size = gameRef.size/2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;
  }
}