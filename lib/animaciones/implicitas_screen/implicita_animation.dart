import 'package:flutter/material.dart';

class ImplicitaAnimationExample extends StatefulWidget {
  const ImplicitaAnimationExample({super.key});

  @override
  State<ImplicitaAnimationExample> createState() =>
      ImplicitaAnimationExampleState();
}

class ImplicitaAnimationExampleState extends State<ImplicitaAnimationExample> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animación Implícita'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _big = !_big;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: _big ? 200 : 100,
            height: _big ? 200 : 100,
            color: _big ? Colors.blue : Colors.red,
            child: const Center(
              child: Text(
                'Toca aquí',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}