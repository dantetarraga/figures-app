import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottie extends StatefulWidget {
  final String lottie;
  final double animationDuration;

  const AnimatedLottie({
    required this.lottie,
    this.animationDuration = 2.0,
  });

  @override
  _AnimatedLottieState createState() => _AnimatedLottieState();
}

class _AnimatedLottieState extends State<AnimatedLottie>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.animationDuration.toInt()),
    );

    final startAlignment = Alignment.topCenter;
    final endAlignment = Alignment.bottomCenter;

    _animation = Tween<Alignment>(
      begin: startAlignment,
      end: endAlignment,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          alignment: _animation.value,
          child: Lottie.asset(
            widget.lottie,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
