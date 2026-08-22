import 'package:flutter/material.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  const TweenAnimationBuilderWidget({super.key});

  @override
  State<TweenAnimationBuilderWidget> createState() =>
      _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState
    extends State<TweenAnimationBuilderWidget> {
  final double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 1.5,
            end: 0.5,
          ), // tween menggunakan tween<double>
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInBack,
          child: const Text(
            // child yang menampung widget statis agar tidak dirender ulang saat terjadinya perubahan frame
            "Box Aktif",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          builder: (context, value, child) {
            // builder dieksekusi disetiap frame perubahan nilai
            return Transform.scale(
              scale: value,
              child: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10 * value,
                    ),
                  ],
                ),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
