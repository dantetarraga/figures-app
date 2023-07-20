import 'package:app_kids/screen/home_page.dart';
import 'package:app_kids/screen/home_page2.dart';
import 'package:app_kids/screen/welcome_page.dart';
import 'package:app_kids/widgets/count_star.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountStar(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final int count = 0;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/gamepage': (context) => HomePage(),
        '/gamepage2': (context) => HomePage2(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomePage(),
    );
  }
}
