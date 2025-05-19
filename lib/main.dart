import 'package:flutter/material.dart';
import 'animaciones/implicitas_screen/implicita_animation.dart'; // Importa tu archivo

void main() {
  runApp(const AnimacionesDemoApp());
}

class AnimacionesDemoApp extends StatelessWidget {
  const AnimacionesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animaciones',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimacionesHome(),
    );
  }
}

class AnimacionesHome extends StatefulWidget {
  const AnimacionesHome({super.key});

  @override
  _AnimacionesHomeState createState() => _AnimacionesHomeState();
}

class _AnimacionesHomeState extends State<AnimacionesHome>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: 100, end: 200)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleSimpleAnimation() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void startAdvancedAnimation() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones en Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('1. AnimatedContainer & AnimatedOpacity',
                style: TextStyle(fontWeight: FontWeight.bold)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: isExpanded ? 200 : 100,
              height: isExpanded ? 200 : 100,
              color: isExpanded ? Colors.blue : Colors.red,
              curve: Curves.easeInOut,
            ),
            AnimatedOpacity(
              opacity: isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: const Text('¡Hola animación!'),
            ),
            ElevatedButton(
              onPressed: toggleSimpleAnimation,
              child: const Text('Alternar animación simple'),
            ),
            const Divider(height: 32),
            const Text('2. AnimationController + Tween',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: Colors.green,
            ),
            ElevatedButton(
              onPressed: startAdvancedAnimation,
              child: const Text('Iniciar animación avanzada'),
            ),
            const Divider(height: 32),
            // Botón para navegar a la animación implícita personalizada
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ImplicitaAnimationExample(),
                  ),
                );
              },
              child: const Text('Ver Implicita Animation Example'),
            ),
          ],
        ),
      ),
    );
  }
}
