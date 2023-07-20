import 'package:app_kids/screen/welcome_page.dart';
import 'package:app_kids/widgets/card_figure.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_kids/widgets/count_star.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  Function? increaseStar;
  HomePage({Key? key, this.increaseStar}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Map<String, dynamic>> images = {
    'Rectangulo': {
      'imageFigure': 'assets/figures/rectangle.png',
      'color': Colors.red,
      'imageAnimal': 'assets/images/c_crab.png'
    },
    'Circulo': {
      'imageFigure': 'assets/figures/circle_r.png',
      'color': Color.fromARGB(255, 246, 195, 14),
      'imageAnimal': 'assets/images/c_deer.png'
    },
    'Cuadrado': {
      'imageFigure': 'assets/figures/square.png',
      'color': Color.fromARGB(255, 113, 179, 233),
      'imageAnimal': 'assets/images/c_bluebird.png'
    },
    'Triangulo': {
      'imageFigure': 'assets/figures/triangle.png',
      'color': const Color.fromARGB(255, 226, 225, 217),
      'imageAnimal': 'assets/images/c_elephant.png'
    },
    'Rombo': {
      'imageFigure': 'assets/figures/rombo_2.png',
      'color': Color.fromARGB(255, 81, 155, 216),
      'imageAnimal': 'assets/images/c_fish.png'
    },
  };
  final Map<String, List<Map<String, dynamic>>> shapeData = {
    "Rectangulo": [
      {
        "image": "assets/lottie/pizza.json",
        "isCorrect": false,
        "audio": "audio/triangulo_error.mp3",
        "color": Colors.blue
      },
      {
        "image": "assets/lottie/clock-circle.json",
        "isCorrect": false,
        "audio": "audio/circulo_error.mp3",
        "color": Color.fromARGB(255, 245, 169, 199)
      },
      {
        "image": "assets/lottie/cards.json",
        "isCorrect": true,
        "audio": "audio/logrado-v2.mp3",
        "color": Color.fromARGB(255, 247, 239, 239),
        "lottie": 'assets/lottie/rabbit.json'
      },
      {
        "image": "assets/lottie/stop.json",
        "isCorrect": false,
        "audio": "audio/hexagono_error.mp3",
        "color": Colors.yellow
      }
    ],
    "Circulo": [
      {
        "image": "assets/lottie/cookie.json",
        "isCorrect": true,
        "audio": "audio/logrado-v2.mp3",
        "color": Color.fromARGB(255, 247, 239, 239),
        "lottie": 'assets/lottie/duck.json'
      },
      {
        "image": "assets/lottie/old-television.json",
        "isCorrect": false,
        "audio": "audio/rectangulo-error.mp3",
        "color": Colors.blue,
      },
      {
        "image": "assets/lottie/rombo.json",
        "isCorrect": false,
        "audio": "audio/rombo-error.mp3",
        "color": Color.fromARGB(255, 245, 169, 199)
      },
      {
        "image": "assets/lottie/star.json",
        "isCorrect": false,
        "audio": "audio/estrella-error.mp3",
        "color": Color.fromARGB(255, 170, 235, 166)
      }
    ],
    "Cuadrado": [
      {
        "image": "assets/lottie/clock-circle.json",
        "isCorrect": false,
        "audio": "audio/circulo-error.mp3",
        "color": Colors.blue
      },
      {
        "image": "assets/lottie/circulo.json",
        "isCorrect": false,
        "audio": "audio/circulo_error.mp3",
        "color": Color.fromARGB(255, 245, 169, 199)
      },
      {
        "image": "assets/lottie/book_2.json",
        "isCorrect": true,
        "audio": "audio/logrado-v2.mp3",
        "color": Color.fromARGB(255, 247, 239, 239),
        "lottie": 'assets/lottie/crab.json'
      },
      {
        "image": "assets/lottie/rombo.json",
        "isCorrect": false,
        "audio": "audio/rombo-error.mp3",
        "color": Colors.yellow
      }
    ],
    "Triangulo": [
      {
        "image": "assets/lottie/cuadrado.json",
        "isCorrect": false,
        "audio": "audio/cuadrado-error.mp3",
        "color": Colors.blue
      },
      {
        "image": "assets/lottie/clock-circle.json",
        "isCorrect": false,
        "audio": "audio/circulo_error.mp3",
        "color": Color.fromARGB(255, 245, 169, 199)
      },
      {
        "image": "assets/lottie/stop.json",
        "isCorrect": false,
        "audio": "audio/hexagono_error.mp3",
        "color": Colors.yellow
      },
      {
        "image": "assets/lottie/warning.json",
        "isCorrect": true,
        "audio": "audio/logrado-v2.mp3",
        "color": Color.fromARGB(255, 247, 239, 239),
        "lottie": 'assets/lottie/cat.json'
      },
    ],
    "Rombo": [
      {
        "image": "assets/lottie/pizza.json",
        "isCorrect": false,
        "audio": "audio/triangulo_error.mp3",
        "color": Colors.blue
      },
      {
        "image": "assets/lottie/compass.json",
        "isCorrect": true,
        "audio": "audio/logrado-v2.mp3",
        "color": Color.fromARGB(255, 247, 239, 239),
        "lottie": 'assets/lottie/dog.json'
      },
      {
        "image": "assets/lottie/cards.json",
        "isCorrect": false,
        "audio": "audio/rectangulo-error.mp3",
        "color": Color.fromARGB(255, 245, 169, 199)
      },
      {
        "image": "assets/lottie/circulo.json",
        "isCorrect": false,
        "audio": "audio/circulo-error.mp3",
        "color": Colors.yellow
      }
    ],
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var countProvider = Provider.of<CountStar>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          title: Lottie.asset('assets/lottie/pensando.json', height: 120),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 90,
                ),
                Text(
                  countProvider.count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final figureName = images.keys.elementAt(index);
            final figureData = images[figureName]!;
            final imageFigure = figureData['imageFigure'];
            final figureColor = figureData['color'];
            final figureAnimal = figureData['imageAnimal'];
            List<Map<String, dynamic>> alternative = shapeData[figureName]!;

            return CardFigure(
              nameFigure: figureName,
              imageFigure: imageFigure,
              color: figureColor,
              imageAnimal: figureAnimal,
              alternativas: alternative,
              title: figureName,
              increaseStar: countProvider.increment,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => (
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            ),
          ),
          child: const Icon(
            Icons.home,
            size: 45,
          ),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
