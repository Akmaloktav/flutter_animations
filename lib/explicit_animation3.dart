import 'package:flutter/material.dart';

class ExplicitAnimation3 extends StatefulWidget {
  const ExplicitAnimation3({super.key});

  @override
  State<ExplicitAnimation3> createState() => _ExplicitAnimation3State();
}

class _ExplicitAnimation3State extends State<ExplicitAnimation3>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // Ukuran batas tinggi panel
  final double _minHeight = 80.0;
  final double _maxHeight = 450.0;

  // Animasi turunan
  late Animation<double> _heightAnimation;
  late Animation<BorderRadius?> _borderRadiusAnimation;
  late Animation<double> _contentOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    // Interpolasi tinggi panel dari 80px ke 450px
    _heightAnimation = Tween<double>(begin: _minHeight, end: _maxHeight)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Sudut membulat hanya ada saat panel tertutup, dan memipih saat terbuka penuh
    _borderRadiusAnimation = BorderRadiusTween(
      begin: const BorderRadius.vertical(top: Radius.circular(24.0)),
      end: BorderRadius.zero,
    ).animate(_animationController);

    // Content detail yang muncul jika panel ditarik di atas 30%
    _contentOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Logika Gesture
  // Dipanggil setiap kali jari bergeser di layar
  void _handleDragUpdate(DragUpdateDetails details) {
    // Total jarak gerak yang bisa ditempuh controller (450 - 80 = 370px)
    final double totalScrollDistance = _maxHeight - _minHeight;

    // Flutter: Layar atas = Y: 0, Layar bawah = Y: positif.
    // Menarik KE ATAS bernilai delta.dy NEGATIF, jadi kita kurangkan agar controller.value BERTAMBAH.
    _animationController.value -= details.primaryDelta! / totalScrollDistance;
  }

  // Dipanggil saat jari lepas dari layar
  void _handleDragEnd(DragEndDetails details) {
    // Ambil kecepatan lemparan jari (piksel per detik)
    final double velocity = details.primaryVelocity ?? 0;
    final double totalScrollDistance = _maxHeight - _minHeight;

    // 1. Jika dilempar cepat ke atas (kecepatan negatif besar) -> Buka penuh dengan fling
    if (velocity < -500) {
      final double visualVelocity = -velocity / totalScrollDistance;
      _animationController.fling(velocity: visualVelocity);
    }
    // 2. Jika dilempar cepat ke bawah (kecepatan positif besar) -> Tutup dengan fling
    else if (velocity > 500) {
      final double visualVelocity = -velocity / totalScrollDistance;
      _animationController.fling(velocity: visualVelocity);
    }
    // 3. Jika dilepas santai tanpa lemparan -> Tentukan berdasarkan posisi (apakah sudah lewat 50%?)
    else {
      if (_animationController.value > 0.5) {
        _animationController.forward(); // Selesaikan ke atas (1.0)
      } else {
        _animationController.reverse(); // Kembalikan ke bawah (0.0)
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Tarik panel di bawah ke atas\natau lempar dengan cepat',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    height: _heightAnimation.value,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: _borderRadiusAnimation.value,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Now Playing / Info Panel',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        Expanded(
                          child: Opacity(
                            opacity: _contentOpacityAnimation.value,
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                'Ini adalah konten detail yang terbuka penuh saat panel ditarik ke atas.\n\nSemua perubahan tinggi, bentuk sudut, dan opasitas teks diikat pada satu Controller yang dikendalikan langsung oleh pergerakan jari Anda.',
                                style: TextStyle(color: Colors.white70),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
