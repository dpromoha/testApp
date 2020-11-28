import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Color _randomColor = Colors.white;

  final rgb = math.Random();

  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.yellow;

    return Scaffold(
      backgroundColor: _randomColor,
      appBar: AppBar(
        title: Center(
          child: Text('Test'),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(
                    () {
                  _randomColor = Color(rgb.nextInt(0xFFFFFFFF));
                },
              );
            },
          ),
          Center(
            child: Text('Hey there',
              style: TextStyle(fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                background: paint,
              ),
            ),
          )
        ],
      ),
    );
  }
}