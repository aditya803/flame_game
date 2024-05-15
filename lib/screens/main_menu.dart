import 'package:flame_game/constants/globals.dart';
import 'package:flutter/material.dart';

import 'game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${Globals.bgSprite}"),
          fit: BoxFit.cover)
        ),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 50),
              child: Text("Gift Grab",style: TextStyle(fontSize: 30),),),
              SizedBox(width: 400,height: 100,
                  child:ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => GamePlay())
                    );
                  }, child: const Text('Play',
                  style: TextStyle(
                    fontSize: 30
                  ),)),)
            ],
          ),
        ),
      ),
    );
  }
}
