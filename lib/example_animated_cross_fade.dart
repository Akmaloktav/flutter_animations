import 'package:flutter/material.dart';

class ExampleAnimatedCrossFade extends StatefulWidget {
  const ExampleAnimatedCrossFade({super.key});

  @override
  State<ExampleAnimatedCrossFade> createState() =>
      _ExampleAnimatedCrossFadeState();
}

class _ExampleAnimatedCrossFadeState extends State<ExampleAnimatedCrossFade> {
  bool _isLoading = false;

  void hadleSubmit() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(milliseconds: 2500));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          firstChild: ElevatedButton.icon(
            onPressed: () => hadleSubmit(),
            label: Text("Contoh kirim pembayaran"),
            icon: Icon(Icons.send_rounded),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          secondChild: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ),
          crossFadeState: _isLoading
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
          sizeCurve: Curves.easeInOutCubic,
        ),
      ),
    );
  }
}
