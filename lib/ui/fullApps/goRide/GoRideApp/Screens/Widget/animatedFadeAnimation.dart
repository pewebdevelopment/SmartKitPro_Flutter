import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class AnimatedFadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const AnimatedFadeAnimation(this.delay, this.child, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500))
      ..add(AniProps.translateY, Tween(begin: -130.0, end: 0.0),
          Duration(milliseconds: 500), Curves.easeOut);
    return PlayAnimation<MultiTweenValues<AniProps>>(
        tween: _tween, // specify tween
        duration: _tween.duration,
        child: child,
        delay: Duration(milliseconds: (500 * delay).round()),
        curve: Curves.easeOut,
        builder: (context, child, value) {
          return Opacity(
              opacity: value.get(AniProps.opacity),
              child: Transform.translate(
                  offset: Offset(0, value.get(AniProps.translateY)),
                  child: child));
        });
  }
}
