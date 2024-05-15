import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game/components/bg_component.dart';
import 'package:flame_game/components/gift_component.dart';
import 'package:flame_game/components/santa_component.dart';
import 'package:flame_game/inputs/joystick.dart';

import '../constants/globals.dart';

class GiftGrabGame extends FlameGame with HasCollisionDetection{
  int score =0;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    
    add(BgComponent());
    add(SantaComponent(joystick: joystickComponent));
    add(GiftComponent());
    add(joystickComponent);
    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,

    ]);
  }
}