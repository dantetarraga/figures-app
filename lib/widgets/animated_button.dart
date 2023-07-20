import 'package:app_kids/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedButton extends StatefulWidget {
  final String image;
  final String url;
  Function? star;

  AnimatedButton({
    Key? key,
    required this.image,
    required this.url,
    this.star,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double buttonSize = 70.0;
  bool isGrowing = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (isGrowing) {
          buttonSize = 85.0;
        } else {
          buttonSize = 70.0;
        }
        isGrowing = !isGrowing;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el temporizador en dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, widget.url);
        },
        elevation: 5.0,
        backgroundColor: Color.fromARGB(255, 244, 250, 255),
        splashColor: Color.fromARGB(255, 120, 187, 128),
        child: Image.asset(
          widget.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
