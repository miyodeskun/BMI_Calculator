import 'dart:async';
import 'bmicalc.dart';
import 'package:flutter/material.dart';

void main() => runApp(const myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI Calc',
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: const SplashPage());
  }
}

@override
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const BmiCalcPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('BMI Calculator',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Image.asset("assets/images/measuretape.png"),
          const Text(
            'Version 0.0.1',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
