import 'package:flame/game.dart';
import 'package:flame_game/components/bg_component.dart';
import 'package:flame_game/components/santa_component.dart';

class GiftGrabGame extends FlameGame{
  @override
  Future<void> onLoad() async{
    await super.onLoad();
    
    add(BgComponent());
    add(SantaComponent());
  }
}