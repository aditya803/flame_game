import 'package:flame/components.dart';
import 'package:flame_game/constants/globals.dart';
import 'package:flame_game/game/gift_grab_game.dart';

class BgComponent extends SpriteComponent with HasGameRef<GiftGrabGame>{
  @override
  Future<void> onLoad() async{
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.bgSprite);
    size = gameRef.size;
  }
}