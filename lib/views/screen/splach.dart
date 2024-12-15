import 'dart:async';
import 'package:flutter/material.dart';

class Splach extends StatelessWidget {
  const Splach({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, '/home');
    },);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Image.asset("assets/images/images.jpeg"),
      ),
    );
  }
}
