import 'dart:math' show Random;

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  showPerformanceOverlay: false,
  home: new Scaffold(
    appBar: new AppBar(title: const Text('Explosion Demo')),
    body: new World())));

const int kObjects = 300;
const FractionalOffset kInitialPosition = const FractionalOffset(0.5, 0.2);
const double kMaxExplosionLinearVelocity = 2.0;
const double kMaxExplosionRotationalVelocity = 3.0;
const double kDrag = 0.2;
const FractionalOffset kGravity = const FractionalOffset(0.0, 1.3);

class World extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WorldState();
}

class WorldState extends State<World> with SingleTickerProviderStateMixin {
  bool exploded;
  AnimationController worldAnimationController;
  Random random;

  @override
  void initState() {
    super.initState();
    exploded = false;
    worldAnimationController = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4));
    random = new Random();
  }

  FractionalOffset _randomFractionalOffset(double amplitude) {
    return new FractionalOffset(
      random.nextDouble() * 2 * amplitude - amplitude,
      random.nextDouble() * 2 * amplitude - amplitude);
  }

  @override
  Widget build(BuildContext context) {
    if (!exploded) {
      return new Align(
        alignment: kInitialPosition,
        child: new RaisedButton(
            child: const Text('Explode'),
            onPressed: () {
              setState(() {
                exploded = true;
                worldAnimationController.forward(from: 0.0);
              });
            }));
    }

    return new Stack(children: new List<Widget>.generate(kObjects, (int index) {
      return new AlignTransition(
        alignment: new HorizontallyBoundBallisticFractionalOffsetTween(
          // Start from slightly different places.
          initialPosition: kInitialPosition + _randomFractionalOffset(0.08),
          initialVelocity: _randomFractionalOffset(kMaxExplosionLinearVelocity))
              .animate(worldAnimationController),
        child: new RotationTransition(
          turns: new Tween<double>(
            begin: random.nextDouble(),
            end: random.nextDouble() * kMaxExplosionRotationalVelocity - kMaxExplosionRotationalVelocity / 2.0)
                .animate(worldAnimationController),
          child: const Image(
            width: 50.0,
            image: const AssetImage('assets/panda.png'))));
    })..add(
      new Align(
        alignment: FractionalOffset.topLeft,
        child: new RaisedButton(
          child: const Text('Reset'),
          onPressed: () { setState(() { exploded = false; }); }))));
  }
}

class HorizontallyBoundBallisticFractionalOffsetTween extends Tween<FractionalOffset> {
  HorizontallyBoundBallisticFractionalOffsetTween({
    this.initialPosition,
    this.initialVelocity,
    this.drag: kDrag,
    this.gravity: kGravity});

  final FractionalOffset initialPosition;
  final FractionalOffset initialVelocity;
  // For extreme simplicity, expressed as fraction of initial velocity lost
  // at the end of the animation.
  final double drag;
  final FractionalOffset gravity;

  // Reflect hits against the horizontal edges once.
  // TODO: incur some velocity loss on collision.
  static FractionalOffset _horizontallyBind(FractionalOffset original) {
    return new FractionalOffset(
      original.dx > 1.0
          ? -original.dx + 2
          : original.dx < 0.0
              ? -original.dx
              : original.dx,
      // Leave vertical as is.
      original.dy);
  }

  @override
  FractionalOffset evaluate(Animation<double> animation) {
    final double t = animation.value;
    if (t == 0.0)
      return initialPosition;
    return lerp(t);
  }

  @override
  FractionalOffset lerp(double t) {
    return _horizontallyBind(
      initialPosition
      + initialVelocity * (1 - drag * t) * t
      + gravity * t * t);
  }
}
