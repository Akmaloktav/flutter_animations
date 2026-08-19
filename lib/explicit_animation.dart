import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

// Yang pertama, Ketika ingin mengatur animasi secara mandiri tambahkan object tickerproviderstatemixin
class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _curvedAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Membuat kurva percepatan
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    );

    // Membuat tween untuk ukuran
    _sizeAnimation = Tween<double>(
      begin: 100.0,
      end: 200.0,
    ).animate(_curvedAnimation);

    // Membuat tween untuk warna
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blueAccent,
    ).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(16),
              ),
            );
          },
        ),
      ),
    );
  }
}
