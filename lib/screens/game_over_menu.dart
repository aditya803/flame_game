import 'package:flame_game/game/gift_grab_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/globals.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final GiftGrabGame gameRef;

  const GameOverMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${Globals.bgSprite}"),
              fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                      'Game Over',
                  style: TextStyle(
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50
                  ),
                  ),),
              Padding(padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Score: ${gameRef.score}',
                style: const TextStyle(
                  fontSize: 50,
                    fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: ElevatedButton(
                    onPressed: (){
                      gameRef.overlays.remove(GameOverMenu.ID);
                      gameRef.reset();
                      gameRef.resumeEngine();
                    }, child: const Text(
                  'Play Again?',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,

                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
