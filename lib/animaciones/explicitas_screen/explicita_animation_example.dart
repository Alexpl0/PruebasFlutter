import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  ExplicitAnimationExampleState createState() =>
      ExplicitAnimationExampleState();
}

class ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _sizeAnimation = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {}); // redibuja cuando cambia el valor animado
    });
  }

  //Limpieza
  //Libera el recurso del AnimationController cuando el widget se destruye.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isExpanded = false;

  //Método para alternar la animación
  void _toggleAnimation() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    _isExpanded = !_isExpanded;
  }

  //Método build – Interfaz visual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Explícita')),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: Colors.purple,

            child: Center(
              child: Text('Toca aquí', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
