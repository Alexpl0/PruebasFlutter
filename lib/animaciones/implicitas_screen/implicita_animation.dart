import 'package:flutter/material.dart';

class ImplicitaAnimationExample extends StatefulWidget {
  @override
  ImplicitaAnimationExampleState createState() => ImplicitaAnimationExampleState();
}

class ImplicitaAnimationExampleState extends State<ImplicitaAnimationExample> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicita Animation')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          width: _big ? 200 : 100,
          height: _big ? 200 : 100,
          color: _big ? Colors.blue : Colors.orange,
          child: Center(
            child: Text(
              'Implicita Animation',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _big = !_big;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}