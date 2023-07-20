import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  Function? star;
  int count;

  CustomAppBar({Key? key, required this.count});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isStarPressed = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isStarPressed = !isStarPressed;
            });
            if (isStarPressed) {
              // Reproducir audio cuando se presiona la estrella
              audioPlayer.play(
                AssetSource('audio/logrado.mp3'),
              );
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 90,
              ),
              Text(
                widget.count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
