import 'package:app_kids/screen/home_page.dart';
import 'package:app_kids/widgets/animated_button.dart';
import 'package:flutter/material.dart';

class GameCards extends StatelessWidget {
  Function? increaseStar;

  GameCards({Key? key, this.increaseStar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      increaseStar: increaseStar,
                    ),
                  ),
                );
              },
              child: Container(
                width: 240,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color.fromARGB(255, 0, 233, 132),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      AnimatedButton(
                        image: 'assets/ardilla.png',
                        url: '/gamepage',
                        star: increaseStar,
                      ),
                      SizedBox(width: 18),
                      const Text(
                        'Conociendo \nlas figuras',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 23,
                          fontFamily: 'Patrick',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/gamepage2');
              },
              child: Container(
                width: 250,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color.fromARGB(255, 0, 233, 132),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      AnimatedButton(
                        image: 'assets/panda-pintor.png',
                        url: '/gamepage2',
                      ),
                      SizedBox(width: 18),
                      Text(
                        '¡A pintar \nlas figuras!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 23,
                          fontFamily: 'Patrick',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
