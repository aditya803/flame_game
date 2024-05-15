import 'package:flame/game.dart';
import 'package:flame_game/screens/game_over_menu.dart';
import 'package:flutter/cupertino.dart';
import '../game/gift_grab_game.dart';

final GiftGrabGame _giftGrabGame = GiftGrabGame();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
        game: _giftGrabGame,
        overlayBuilderMap:{
          GameOverMenu.ID: (BuildContext context, GiftGrabGame gameRef) =>
              GameOverMenu(gameRef: gameRef)
        },
    );
  }
}
