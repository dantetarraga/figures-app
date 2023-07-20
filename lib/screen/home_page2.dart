import 'package:app_kids/screen/welcome_page.dart';
import 'package:app_kids/widgets/card_figure.dart';
import 'package:app_kids/widgets/custom_appbar.dart';
import 'package:app_kids/widgets/game_card2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_kids/widgets/count_star.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  Function? increaseStar;
  HomePage2({Key? key, this.increaseStar}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final Map<String, Map<String, dynamic>> images = {
    'Nivel 1': {
      'imageFigure': 'assets/figures/sphere.png',
      'color': Colors.red,
      'imageAnimal': 'assets/images/c_crab.png'
    },
    'Nivel 2': {
      'imageFigure': 'assets/figures/cube.png',
      'color': Color.fromARGB(255, 246, 195, 14),
      'imageAnimal': 'assets/images/c_deer.png'
    },
    'Nivel 3': {
      'imageFigure': 'assets/figures/cone.png',
      'color': Color.fromARGB(255, 113, 179, 233),
      'imageAnimal': 'assets/images/c_bluebird.png'
    },
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
          title:
              Lottie.asset('assets/lottie/rabbit_meditando.json', height: 120),
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

            return CardPrint(
              nameFigure: figureName,
              imageFigure: imageFigure,
              color: figureColor,
              imageAnimal: figureAnimal,
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
