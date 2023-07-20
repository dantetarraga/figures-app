import 'package:app_kids/screen/games/game.dart';
import 'package:flutter/material.dart';

class CardFigure extends StatefulWidget {
  final String nameFigure;
  final String imageFigure;
  final Color color;
  final String imageAnimal;
  final String title;
  final List<Map<String, dynamic>> alternativas;
  Function? increaseStar;

  CardFigure({
    Key? key,
    required this.nameFigure,
    required this.imageFigure,
    required this.color,
    required this.imageAnimal,
    required this.alternativas,
    required this.title,
    this.increaseStar,
  }) : super(key: key);

  @override
  _CardFigureState createState() => _CardFigureState();
}

class _CardFigureState extends State<CardFigure> {
  bool showCross = false;

  void updateShowCross(bool value) {
    setState(() {
      showCross = true;
    });
    print("eqwe");
    showCross = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Game(
              alternativas: widget.alternativas,
              title: widget.title,
              increaseStar: widget.increaseStar,
              updateShowCross: updateShowCross,
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
                  color: widget.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(maxWidth: 330, maxHeight: 200),
              ),
            ),
            Positioned(
              top: 25,
              child: Hero(
                tag: widget.nameFigure,
                transitionOnUserGestures: true,
                child: Image(
                  image: AssetImage(widget.imageFigure),
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 160,
              child: Text(
                widget.nameFigure,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Patrick',
                ),
              ),
            ),
            if (showCross)
              Positioned(
                top: 10,
                right: 60,
                child: Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 0, 255, 21),
                  size: 50,
                ),
              ),

            // Positioned(
            //  top: 50,
            //  right: 5,
            //  child: Image(
            //    image: AssetImage(widget.imageAnimal),
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
