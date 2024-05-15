import 'package:flame/game.dart';
import 'package:flame_game/game/gift_grab_game.dart';
import 'package:flame_game/screens/main_menu.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    )
  );
}


