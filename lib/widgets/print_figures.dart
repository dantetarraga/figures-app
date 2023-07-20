import 'package:app_kids/widgets/audioplayer.dart';
import 'package:app_kids/widgets/correct_answer.dart';
import 'package:app_kids/widgets/corrrect_answer2.dart';
import 'package:app_kids/widgets/figure_type.dart';
import 'package:app_kids/widgets/custom_shape.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class PrintFigures extends StatefulWidget {
  Function? increaseStar;
  String title;
  Map<String, List<FigureType>> respuestas;
  String? instruccion;
  AudioPlayerUrl? audioPlayerUrl;
  PrintFigures(
      {Key? key,
      this.increaseStar,
      required this.title,
      required this.respuestas,
      this.instruccion,
      this.audioPlayerUrl});

  @override
  State<PrintFigures> createState() => _PrintFiguresState();
}

class _PrintFiguresState extends State<PrintFigures> {
  int indice = 0;

  List<FigureType> instrucciones = [
    FigureType.triangle,
    FigureType.diamond,
    FigureType.circle,
    FigureType.square,
  ];

  Map<FigureType, Map<String, dynamic>> shapes = {
    FigureType.triangle: {
      'index': 0,
      'isCorrect': 'audio/logrado-v2.mp3',
      'error': 'audio/triangulo_error.mp3',
      'color': const Color.fromARGB(255, 255, 255, 255),
      'correcColor': Colors.blue,
    },
    FigureType.circle: {
      'index': 1,
      'isCorrect': 'audio/logrado-v2.mp3',
      'error': 'audio/circulo-error.mp3',
      'color': const Color.fromARGB(255, 255, 255, 255),
      'correcColor': Colors.yellow,
    },
    FigureType.square: {
      'index': 2,
      'isCorrect': 'audio/logrado-v2.mp3',
      'error': 'audio/cuadrado-error.mp3',
      'color': const Color.fromARGB(255, 255, 255, 255),
      'correcColor': Colors.red,
    },
    FigureType.diamond: {
      'index': 3,
      'isCorrect': 'audio/logrado-v2.mp3',
      'error': 'audio/rombo-error.mp3',
      'color': const Color.fromARGB(255, 255, 255, 255),
      'correcColor': Colors.yellow,
    },
  };

  Color selectedColor = Color.fromARGB(255, 255, 255, 255);
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.stopped;

  void selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  void _changeColor(int index, Color newColor) {
    setState(() {
      FigureType figureType = shapes.keys.elementAt(index);
      Map<String, dynamic> shapeData = shapes[figureType]!;
      shapeData['color'] = newColor;
    });
  }

  void selectNivel(String title) {
    if (title == 'Nivel 1') {
      indice = 0;
    } else if (title == 'Nivel 2') {
      indice = 3;
    } else if (title == 'Nivel 3') {
      indice = 1;
    }
  }

  Future<void> playAudio(String url) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource(url));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });
  }

  void checkAnswer(String error, FigureType figureType, Color correcColor,
      String isCorrect, String title) {
    if (instrucciones[indice] != figureType) {
      playAudio(error);
    } else if (correcColor == selectedColor &&
        instrucciones[indice] == figureType) {
      playAudio("audio/logrado-v2.mp3");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CorrectAnswerDialog2(
            lottie: 'assets/lottie/cat.json',
          );
        },
      );
      widget.increaseStar!();
    } else if (correcColor != selectedColor &&
        instrucciones[indice] == figureType) {
      playAudio('audio/error_color.mp3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorButton(
                color: Colors.red,
                isSelected: selectedColor == Colors.red,
                onTap: () {
                  selectColor(Colors.red);
                  playAudio('audio/rojo.mp3');
                },
              ),
              ColorButton(
                color: Colors.yellow,
                isSelected: selectedColor == Colors.yellow,
                onTap: () {
                  selectColor(Colors.yellow);
                  playAudio('audio/amarillo.mp3');
                },
              ),
              ColorButton(
                color: Colors.blue,
                isSelected: selectedColor == Colors.blue,
                onTap: () {
                  selectColor(Colors.blue);
                  playAudio('audio/azul.mp3');
                },
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height * 0.5),
            children: List.generate(shapes.length, (index) {
              FigureType figureType = shapes.keys.elementAt(index);
              Map<String, dynamic> shapeData = shapes[figureType]!;
              Color shapeColor = shapeData['color'];
              Color correcColor = shapeData['correcColor'];
              String error = shapeData['error'];
              String isCorrect = shapeData['isCorrect'];
              return GestureDetector(
                onTap: () {
                  _changeColor(index, selectedColor);
                  selectNivel(widget.title);
                  checkAnswer(
                    error,
                    figureType,
                    correcColor,
                    isCorrect,
                    widget.title,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: CustomPaint(
                      painter: CustomShapePainter(
                        color: shapeColor,
                        figureType: figureType,
                      ),
                      size: const Size(100, 100),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function onTap;

  ColorButton({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(255, 37, 215, 43),
                    blurRadius: 20.0,
                    spreadRadius: 18.0,
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
