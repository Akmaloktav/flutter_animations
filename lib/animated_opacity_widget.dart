import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1.0;
  double _opacity2 = 0.0;
  double _size = 200.0;
  double _size2 = 0.0;
  BorderRadius _borderRadius = BorderRadius.circular(0);
  BorderRadius _borderRadius2 = BorderRadius.circular(8);

  void ubahOpacity() {
    setState(() {
      _opacity = _opacity == 0.0 ? 1.0 : 0.0;
      _opacity2 = _opacity2 == 1.0 ? 0.0 : 1.0;
      _size = _size == 0.0 ? 200.0 : 0.0;
      _size2 = _size2 == 200.0 ? 0.0 : 200.0;
      _borderRadius = _borderRadius == BorderRadius.circular(8)
          ? BorderRadius.circular(0)
          : BorderRadius.circular(8);
      _borderRadius2 = _borderRadius2 == BorderRadius.circular(0)
          ? BorderRadius.circular(8)
          : BorderRadius.circular(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity2,
              duration: Duration(seconds: 2),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _size2,
                height: _size2,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: _borderRadius2,
                ),
                curve: Curves.easeIn,
              ),
            ),
            SizedBox(height: 8),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: _borderRadius,
                ),
                curve: Curves.easeIn,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () => ubahOpacity(), child: Text("Ubah")),
          ],
        ),
      ),
    );
  }
}
