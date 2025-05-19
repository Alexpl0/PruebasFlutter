import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Crear el AnimationController para las animaciones
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animación de escala (crecer el logo)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Iniciar la animación
    _controller.forward().whenComplete(() {
      // Mostrar el texto después de completar la animación del logo
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToNextScreen(BuildContext context) {
    // Navegar a la siguiente pantalla (puedes personalizarla)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo con animación de escala
            ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/logo_Liliana.jpg', // Cambia por el logo que deseas
                width: 150,
                height: 150,
              ),
            ),
            // Espacio entre el logo y el texto
            const SizedBox(height: 20),
            // Texto con animación de opacidad
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Bienvenido a la App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Espacio entre el texto y el botón
            const SizedBox(height: 40),
            // Botón para navegar a la siguiente pantalla
            ElevatedButton(
              onPressed: () => navigateToNextScreen(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Siguiente Pantalla')),
      body: const Center(child: Text('Bienvenido a la siguiente pantalla')),
    );
  }
}
