import 'package:flutter/material.dart';

class ExampleAnimatedSlide extends StatefulWidget {
  const ExampleAnimatedSlide({super.key});

  @override
  State<ExampleAnimatedSlide> createState() => _ExampleAnimatedSlideState();
}

class _ExampleAnimatedSlideState extends State<ExampleAnimatedSlide> {
  bool _showBanner = false;

  void _triggerToast() async {
    setState(() {
      _showBanner = true;
    });

    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _showBanner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () => _triggerToast(),
              label: Text("Tampilkan Notifikasi"),
              icon: Icon(Icons.notifications_active),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: AnimatedSlide(
              offset: _showBanner ? Offset(0, 0.2) : Offset(0, -1.2),
              duration: Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 12),
                    const Text(
                      'File berhasil diunduh ke perangkat!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white70,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _showBanner = false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
