import 'package:flutter/material.dart';

class AnimatedSlideWidget extends StatefulWidget {
  const AnimatedSlideWidget({super.key});

  @override
  State<AnimatedSlideWidget> createState() => _AnimatedSlideWidgetState();
}

class _AnimatedSlideWidgetState extends State<AnimatedSlideWidget> {
  Offset _posisiOffset = Offset.zero;

  void pindahPosisi() {
    setState(() {
      _posisiOffset = _posisiOffset == Offset.zero
          ? Offset(-1.0, 0.0)
          : Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => pindahPosisi(),
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 150,
                height: 150,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "Item tetap",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              // SizedBox(width: 20,),
            AnimatedSlide(
              offset: _posisiOffset,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInCubic,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Geser Saya",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
