import 'package:flutter/material.dart';
import 'dart:math'; // Corregido: faltaba el punto y coma

class ExplicitasImplicitasScreen extends StatefulWidget {
  const ExplicitasImplicitasScreen({super.key}); // Corregido: eliminado 'superkey' que no existe
  @override
  State<ExplicitasImplicitasScreen> createState() => _OpacidadRotacionAnimationState();
}

// Corregido: 'with SingleTickerProviderStateMixin' debe ir en la declaración de la clase, no dentro del cuerpo
class _OpacidadRotacionAnimationState extends State<ExplicitasImplicitasScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  
  bool _visible = true;

  @override // Corregido: añadido @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0, end: pi
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );
  }

  // Corregido: setState debe ser una función, no un bloque
  void _toggleAnimation() {
    setState(() {
      _visible = !_visible;
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Corregido: Uso correcto de AnimatedOpacity y AnimatedBuilder, y GestureDetector para el tap
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones Explícitas e Implícitas')),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation, // Corregido: ahora llama a la función correcta
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _visible ? 1.0 : 0.2,
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(12)
                    ),

                    child: Center(
                      child: Text(
                        _visible ? "visible" : "oculto",
                        style: const TextStyle(color: Colors.white)
                      )
                    )
                  ),
                );
              },
              child: const FlutterLogo(size: 100),
            ),
          ),
        ),
      ),
    );
  }
}

// Cambios realizados:
// - Corregido el import de 'dart:math' (faltaba punto y coma).
// - Eliminado 'superkey' del constructor.
// - Movido 'with SingleTickerProviderStateMixin' a la declaración de la clase.
// - Añadido @override a los métodos correspondientes.
// - Añadido método dispose para limpiar el controlador.
// - Corregido el método _toggleAnimation para usar setState correctamente.
// - Corregido el uso de GestureDetector, AnimatedOpacity y AnimatedBuilder en el método build.
// - Añadido Transform.rotate para la animación de rotación.
// - Añadido FlutterLogo como widget animado.