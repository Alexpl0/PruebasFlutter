import 'package:animaciones/animaciones/explicitas_screen/explicita_animation_example.dart';
import 'package:animaciones/animaciones/implicitas_screen/implicita_animation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const AnimacionesApp());
}

class AnimacionesApp extends StatelessWidget{
  const AnimacionesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo de Animaciones',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones en Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ImplicitaAnimationExample()),
                );
              },
              child: const Text('Animación Implícita'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExplicitAnimationExample()),
                );
              },
              child: const Text('Animación Explícita'),
            ),
          ],
        ),
      ),
    );
  }
}