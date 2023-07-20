import 'package:app_kids/widgets/audioplayer.dart';
import 'package:app_kids/widgets/figure_type.dart';
import 'package:app_kids/widgets/print_figures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Game2 extends StatefulWidget {
  Function? increaseStar;
  String title;

  AudioPlayerUrl? audioPlayerUrl;

  Game2(
      {super.key, required this.title, this.increaseStar, this.audioPlayerUrl});

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> with TickerProviderStateMixin {
  late AnimationController _animationController;

  Map<String, String> audios = {
    'Nivel 1': "audio/paint_triangle.mp3",
    'Nivel 2': "audio/cuadrado-print.mp3",
    'Nivel 3': "audio/print-daimont.mp3",
  };

  Map<String, List<FigureType>> respuestas = {
    'Nivel 1': [FigureType.triangle],
    'Nivel 2': [FigureType.square, FigureType.circle],
    'Nivel 3': [FigureType.diamond, FigureType.circle],
  };

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 235,
        centerTitle: true,
        title: Column(
          children: [
            AudioPlayerUrl(url: audios[widget.title]!),
            Lottie.asset('assets/lottie/teacher.json', height: 170),
          ],
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo[200]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            //AudioPlayerUrl(url: audios[widget.title]!),
            SizedBox(
              height: 25,
            ),
            PrintFigures(
              increaseStar: widget.increaseStar,
              title: widget.title,
              respuestas: respuestas,
              instruccion: audios[widget.title]!,
              audioPlayerUrl: widget.audioPlayerUrl,
            ),
          ],
        ),
      ),
    );
  }
}
