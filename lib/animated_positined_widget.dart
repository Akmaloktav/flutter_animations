import 'package:flutter/material.dart';

class AnimatedPositinedWidget extends StatefulWidget {
  const AnimatedPositinedWidget({super.key});

  @override
  State<AnimatedPositinedWidget> createState() =>
      _AnimatedPositinedWidgetState();
}

class _AnimatedPositinedWidgetState extends State<AnimatedPositinedWidget> {
  bool _isMoved = false;

  void togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            top: _isMoved ? 350.0 : 50,
            left: _isMoved ? 200.0 : 50.0,
            width: _isMoved ? 150.0 : 100.0,
            height: _isMoved ? 150.0 : 100.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(Icons.star, color: Colors.white, size: 40),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: ElevatedButton.icon(
                onPressed: () => togglePosition(),
                label: Text(_isMoved ? "Reset Posisi" : "Pindahkan"),
                icon: Icon(Icons.play_arrow_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
