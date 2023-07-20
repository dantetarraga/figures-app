import 'package:app_kids/widgets/correct_answer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class ColorChangingGrid extends StatefulWidget {
  Function? increaseStar;
  final List<Map<String, dynamic>> alternativas;
  final Function(bool)? updateShowCross;

  ColorChangingGrid(
      {Key? key,
      required this.alternativas,
      this.increaseStar,
      this.updateShowCross})
      : super(key: key);

  @override
  _ColorChangingGridState createState() => _ColorChangingGridState();
}

class _ColorChangingGridState extends State<ColorChangingGrid> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.stopped;

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
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

  void changeColor(index) {
    setState(() {
      widget.alternativas[index]['color'] = !widget.alternativas[index]
              ['isCorrect']
          ? Colors.red
          : const Color.fromARGB(255, 104, 158, 106);
      //widget.alternativas[index]['image'] = !widget.alternativas[index]
      //        ['isCorrect']
      //    ? 'assets/lottie/error.json'
      //    : widget.alternativas[index]['image'];

      if (widget.alternativas[index]['isCorrect']) {
        var lottie = widget.alternativas[index]['lottie'];
        widget.increaseStar!();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CorrectAnswerDialog(
              lottie: lottie,
            );
          },
        );
        widget.updateShowCross!(true);
      } else {
        widget.alternativas[index]['audio'] = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height * 0.45),
      children: List.generate(widget.alternativas.length, (index) {
        final alternativa = widget.alternativas[index];
        return GestureDetector(
          onTap: () {
            final String audioPath = alternativa['audio'];
            changeColor(index);
            pauseAudio();
            playAudio(audioPath);
          },
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              color: alternativa['color'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    alternativa['image'],
                    width: 130,
                    height: 130,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
