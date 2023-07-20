import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerUrl extends StatefulWidget {
  final String url;

  AudioPlayerUrl({Key? key, required this.url}) : super(key: key);

  @override
  _AudioPlayerUrlState createState() => _AudioPlayerUrlState();
}

class _AudioPlayerUrlState extends State<AudioPlayerUrl> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.paused;

  Timer? timer; // Variable para almacenar el Timer

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });
    startAutoPlayTimer();
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    timer?.cancel(); // Cancela el Timer antes de finalizar
    super.dispose();
  }

  playMusic() async {
    await audioPlayer.play(AssetSource(widget.url));
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  // Método para iniciar el Timer
  startAutoPlayTimer() {
    const duration = Duration(milliseconds: 900);
    timer = Timer.periodic(duration, (Timer t) {
      if (audioPlayerState != PlayerState.playing) {
        playMusic();
        timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 70,
      onPressed: () {
        audioPlayerState == PlayerState.playing ? pauseMusic() : playMusic();
      },
      icon: Icon(audioPlayerState == PlayerState.playing
          ? Icons.pause
          : Icons.play_arrow),
      color:
          audioPlayerState == PlayerState.playing ? Colors.red : Colors.green,
    );
  }
}
