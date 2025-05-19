import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  ExplicitAnimationExampleState createState() =>
      ExplicitAnimationExampleState();
}

 State<ExplicitAnimationExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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
    _controller.addListener(() {
      setState(() {
        _isExpanded = _controller.status == AnimationStatus.completed;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
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
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
