import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final String imagePath;
  final double animationDuration;

  const AnimatedImage({
    required this.imagePath,
    this.animationDuration = 2.0,
  });

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
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
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
