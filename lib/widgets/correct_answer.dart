import 'package:app_kids/screen/home_page.dart';
import 'package:app_kids/widgets/animated_lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CorrectAnswerDialog extends StatefulWidget {
  final String lottie;

  const CorrectAnswerDialog({Key? key, required this.lottie}) : super(key: key);

  @override
  _CorrectAnswerDialogState createState() => _CorrectAnswerDialogState();
}

class _CorrectAnswerDialogState extends State<CorrectAnswerDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void playAudio(String audioPath) async {
    await _audioPlayer.play(AssetSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: _animation,
              child: SizedBox(
                width: 280,
                height: 400,
                child: Lottie.asset(
                  widget.lottie,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 180,
              height: 180,
              child: GestureDetector(
                onTap: () {
                  playAudio('audio/star-audio.mp3');

                  Future.delayed(const Duration(seconds: 1)).then((_) {
                    Navigator.pushReplacementNamed(context, '/gamepage');
                  });
                },
                child: AnimatedLottie(
                  lottie: 'assets/lottie/good.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
