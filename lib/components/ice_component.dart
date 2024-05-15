import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/constants/globals.dart';
import 'package:flame_game/game/gift_grab_game.dart';
import 'dart:math' as math;

class IceComponent extends SpriteComponent with HasGameRef<GiftGrabGame>, CollisionCallbacks{
  final double _spriteHeight = 100;
  final Vector2 startPosition;

  late Vector2 _velocity;
  double speed = 300;
  double degree = math.pi / 180;
  IceComponent({required this.startPosition});

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;

    double spawnAngle = _getSpawnAngle();
    final double vx = math.cos(spawnAngle * degree)*speed;
    final double vy = math.sin(spawnAngle * degree)*speed;

    _velocity = Vector2(vx, vy);
    add(CircleHitbox()..radius = 1);
  }
  @override
  void update(dt){
    super.update(dt);
    position += _velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other){
    super.onCollision(intersectionPoints, other);
    if(other is ScreenHitbox){
      final Vector2 collisionPoint = intersectionPoints.first;
      if(collisionPoint.x == 0){
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      }
      if(collisionPoint.x >= gameRef.size.x-10){
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      }
      if(collisionPoint.y == 0){
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      }
      if(collisionPoint.y >= gameRef.size.y-10){
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      }
    }
  }


  double _getSpawnAngle(){
    final random = math.Random().nextDouble();
    final spawnAngle = lerpDouble(0, 360, random)!;

    return spawnAngle;
  }
}