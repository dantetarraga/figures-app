import 'package:app_kids/screen/games/game.dart';
import 'package:app_kids/screen/games/game2.dart';
import 'package:flutter/material.dart';

class CardPrint extends StatelessWidget {
  final String nameFigure;
  final String imageFigure;
  final Color color;
  final String imageAnimal;
  final String title;

  Function? increaseStar;

  CardPrint({
    Key? key,
    required this.nameFigure,
    required this.imageFigure,
    required this.color,
    required this.imageAnimal,
    required this.title,
    this.increaseStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Game2(
              title: title,
              increaseStar: increaseStar,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 230,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(maxWidth: 330, maxHeight: 200),
              ),
            ),
            Positioned(
              top: 25,
              child: Hero(
                tag: nameFigure,
                transitionOnUserGestures: true,
                child: Image(
                  image: AssetImage(imageFigure),
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 160,
              child: Text(
                nameFigure,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Patrick',
                ),
              ),
            ),
            //Positioned(
            //  top: 50,
            //  right: 5,
            //  child: Image(
            //    image: AssetImage(imageAnimal),
            //    width: 150,
            //    height: 150,
            //  ),
            //),
          ],
        ),
      ),
    );
  }
}
