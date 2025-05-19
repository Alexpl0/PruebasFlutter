import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  ExplicitAnimationExampleState createState() =>
      ExplicitAnimationExampleState();
}

class ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 300).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (controller.status == AnimationStatus.completed) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Aquí debes construir tu widget animado.
    // Por ejemplo, puedes usar un AnimatedBuilder.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              width: animation.value,
              height: animation.value,
              color: Colors.blue,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
