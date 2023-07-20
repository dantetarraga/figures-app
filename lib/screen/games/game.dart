import 'package:app_kids/widgets/audioplayer.dart';
import 'package:app_kids/widgets/color_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Game extends StatelessWidget {
  String? selectedAudio;
  Function? increaseStar;
  final List<Map<String, dynamic>> alternativas;
  String title;
  final Function(bool)? updateShowCross;
  Game(
      {Key? key,
      required this.alternativas,
      required this.title,
      this.increaseStar,
      this.updateShowCross})
      : super(key: key);

  Map<String, String> shapes = {
    'Rectangulo': "assets/lottie/old-television.json",
    'Circulo': "assets/lottie/circulo.json",
    'Cuadrado': "assets/lottie/cuadrado.json",
    'Triangulo': "assets/lottie/triangulo.json",
    'Rombo': 'assets/lottie/rombo.json',
  };

  Map<String, String> audios = {
    'Rectangulo': "audio/pregunta-rectangulo.mp3",
    'Circulo': "audio/monedas.mp3",
    'Cuadrado': "audio/ventana.mp3",
    'Triangulo': "audio/pizza.mp3",
    'Rombo': 'audio/cometa.mp3',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 240,
        centerTitle: true,
        title: Column(
          children: [
            AudioPlayerUrl(url: audios[title]!!),
            Lottie.asset('assets/lottie/teacher.json', height: 170),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Lottie.asset(shapes[title]!),
            ),
          ),
          ColorChangingGrid(
            alternativas: alternativas,
            increaseStar: increaseStar,
            updateShowCross: updateShowCross,
          ),
        ],
      ),
    );
  }
}
