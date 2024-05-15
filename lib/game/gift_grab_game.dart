import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game/components/bg_component.dart';
import 'package:flame_game/components/gift_component.dart';
import 'package:flame_game/components/ice_component.dart';
import 'package:flame_game/components/santa_component.dart';
import 'package:flame_game/inputs/joystick.dart';

import '../constants/globals.dart';

class GiftGrabGame extends FlameGame with HasCollisionDetection{
  int score =0;

  late Timer _timer;
  int _remainingTime = 30;
  late TextComponent _scoreText;
  late TextComponent _timeText;


  @override
  Future<void> onLoad() async{
    await super.onLoad();
    
    add(BgComponent());
    add(SantaComponent(joystick: joystickComponent));
    add(GiftComponent());
    add(joystickComponent);
    FlameAudio.audioCache.loadAll([
      Globals.itemGrabSound,
      Globals.freezeSound
    ]);
    add(IceComponent(startPosition: Vector2(200,200)));
    add(IceComponent(startPosition: Vector2(size.x - 200,size.y - 200)));
    add(ScreenHitbox());

    _scoreText = TextComponent(
        text: 'Score: $score',
        position: Vector2(40, 40),
        anchor: Anchor.topLeft,
        textRenderer: TextPaint(
          style: TextStyle(
            color: BasicPalette.white.color,
            fontSize: 20
          )
        )
    );
    add(_scoreText);

    _timeText = TextComponent(
        text: 'Time: $_remainingTime seconds',
        position: Vector2(size.x-40, 40),
        anchor: Anchor.topRight,
        textRenderer: TextPaint(
            style: TextStyle(
                color: BasicPalette.white.color,
                fontSize: 20
            )
        )
    );
    add(_timeText);

    _timer = Timer(
      1,
      repeat: true,
      onTick: (){
        if(_remainingTime == 0){
          pauseEngine();
        }else{
          _remainingTime-=1;
        }
      });
    _timer.start();
  }
  
  @override
  void update(dt){
    super.update(dt);
    _timer.update(dt);
    _scoreText.text = 'Score: $score';
    _timeText.text = 'Time: $_remainingTime seconds';
  }
}