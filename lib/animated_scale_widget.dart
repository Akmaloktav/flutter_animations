import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({super.key});

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  bool _isScale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isScale = !_isScale;
            });
          },
          child: AnimatedScale(
            scale: _isScale ? 2.0 : 1.0,
            alignment: Alignment.topLeft,
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(_isScale ? 16 : 0),
              ),
              child: Center(
                child: Text("Tekan", style: TextStyle(color: Colors.amber)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
