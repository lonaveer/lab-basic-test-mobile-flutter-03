import 'package:flutter/material.dart';

void main() {
  runApp(AnimationPageApp());
}

class AnimationPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationDemoPage(),
    );
  }
}

class AnimationDemoPage extends StatefulWidget {
  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage> {
  double _height = 100;
  double _width = 100;
  Color _color = Colors.blue;
  bool _isMoved = false;
  Widget _myAnimatedWidget = Container(
    key: ValueKey<int>(1),
    width: 100.0,
    height: 100.0,
    color: Colors.green,
  );

  void _animateContainer() {
    setState(() {
      _height = _height == 100 ? 200 : 100;
      _width = _width == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  void _animatePositionAndSwitchWidget() {
    setState(() {
      _isMoved = !_isMoved;
      _myAnimatedWidget = _myAnimatedWidget.key == ValueKey<int>(1)
        ? Container(key: ValueKey<int>(2), width: 100.0, height: 100.0, color: Colors.purple)
        : Container(key: ValueKey<int>(1), width: 100.0, height: 100.0, color: Colors.green);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Demo')),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _height,
            width: _width,
            color: _color,
            child: TextButton(
              onPressed: _animateContainer,
              child: Text(
                'Animate Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: _isMoved ? 200 : 0,
                  top: 0,
                  child: _myAnimatedWidget,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _animatePositionAndSwitchWidget,
            child: Text('Animate Position and Switch'),
          ),
        ],
      ),
    );
  }
}