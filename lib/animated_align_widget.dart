import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool _pindah = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _pindah = !_pindah;
            print("terjadi perubahan");
          });
        },
        child: Container(
          color: Colors.yellow,
          child: AnimatedAlign(
            alignment: _pindah ? Alignment.bottomLeft : Alignment.topRight,
            duration: Duration(seconds: 1),
            curve: Curves.bounceInOut,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Center(child: Text("Ini teks")),
            ),
          ),
        ),
      ),
    );
  }
}
