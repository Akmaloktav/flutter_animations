import 'package:flutter/material.dart';

class ExampleAnimatedScale extends StatefulWidget {
  const ExampleAnimatedScale({super.key});

  @override
  State<ExampleAnimatedScale> createState() => _ExampleAnimatedScaleState();
}

class _ExampleAnimatedScaleState extends State<ExampleAnimatedScale> {
  bool _isLiked = false;
  double _scale = 1.0;

  void handleTap() async {
    setState(() {
      _isLiked = !_isLiked;
      _scale = 1.4;
    });

    await Future.delayed(Duration(milliseconds: 150));

    if (mounted) {
      setState(() {
        _scale = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: handleTap,
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isLiked ? Colors.red.shade50 : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey.shade600,
                size: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
