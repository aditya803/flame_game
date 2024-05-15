import 'package:flame/game.dart';
import 'package:flame_game/game/gift_grab_game.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(
        game: GiftGrabGame()
    )
  );
}


