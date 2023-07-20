import 'package:app_kids/widgets/animated_image.dart';
import 'package:app_kids/widgets/card_games.dart';
import 'package:app_kids/widgets/count_star.dart';
import 'package:app_kids/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    var countProvider = Provider.of<CountStar>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paisaje.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBar(
              count: countProvider.count,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 35,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '¡Jugando con formas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Patrick',
                          ),
                        ),
                        TextSpan(
                          text: '\ny colores!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Patrick',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GameCards(
              increaseStar: countProvider.increment,
            ),
            Container(
              height: 150,
              child: const AnimatedImage(
                imagePath: 'assets/figures.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
