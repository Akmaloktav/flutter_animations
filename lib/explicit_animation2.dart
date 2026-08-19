import 'package:flutter/material.dart';

class ExplicitAnimation2 extends StatefulWidget {
  const ExplicitAnimation2({super.key});

  @override
  State<ExplicitAnimation2> createState() => _ExplicitAnimation2State();
}

class _ExplicitAnimation2State extends State<ExplicitAnimation2>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<BorderRadius?> _borderRadiusAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _iconScaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );

    // Membuat efek slide dan fade in di 0% - 40% durasi
    _slideAnimation =
        Tween<Offset>(
          begin: Offset(-3.0, 0.0), // Mulai dari luar layar sebelah kiri
          end: Offset.zero, // Berhenti diposisi normal
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.4, curve: Curves.easeOutCubic),
          ),
        );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    // Membuat efek border ke lingkaran dan perubahan warna pada 40% - 75% durasi
    _borderRadiusAnimation =
        BorderRadiusTween(
          begin: BorderRadius.circular(8.0),
          end: BorderRadius.circular(50.0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.4, 0.75, curve: Curves.easeInOut),
          ),
        );
    _colorAnimation = ColorTween(begin: Colors.indigo, end: Colors.teal)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.4, 0.75, curve: Curves.linear),
          ),
        );

    // Efek pantulan icon pada 75% - 100%
    _iconScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.75, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Memantau siklus hidup status animasi
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Proses Animasi selesai"),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
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
            return FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value,
                    borderRadius: _borderRadiusAnimation.value,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.2)),
                    ],
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: _iconScaleAnimation.value,
                      child:
                          child, // memanfaatkan widget statis yang telah di cache
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 48,
          ), // Optimisasi: elemen statis ditaruh diparameter child agar tidak di re-build tiap frame
        ),
      ),
    );
  }
}
