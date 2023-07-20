import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerQuestion extends StatefulWidget {
  AudioPlayerQuestion({Key? key}) : super(key: key);

  @override
  _AudioPlayerQuestionState createState() => _AudioPlayerQuestionState();
}

class _AudioPlayerQuestionState extends State<AudioPlayerQuestion> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });
  }

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
  Widget build(BuildContext context) {
    return Container();
  }
}
