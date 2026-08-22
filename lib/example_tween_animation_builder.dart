import 'package:flutter/material.dart';

class ExampleTweenAnimationBuilder extends StatefulWidget {
  const ExampleTweenAnimationBuilder({super.key});

  @override
  State<ExampleTweenAnimationBuilder> createState() => _ExampleTweenAnimationBuilderState();
}

class _ExampleTweenAnimationBuilderState extends State<ExampleTweenAnimationBuilder> {
  double _targetProgress = 0.0;

  void _updateProgress() {
    setState(() {
      // Mengubah nilai target antara 0.0 sampai 1.0
      _targetProgress = _targetProgress == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TweenAnimationBuilder Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TweenAnimationBuilder untuk menganimasikan double dari 0.0 ke _targetProgress
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: _targetProgress),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutCubic,
              builder: (BuildContext context, double value, Widget? child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Lingkaran Progres
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: value,
                        strokeWidth: 12,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
                      ),
                    ),
                    // Teks Persentase Berjalan
                    Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: _updateProgress,
              icon: const Icon(Icons.refresh),
              label: Text(_targetProgress == 0.0 ? 'Mulai Unduh (100%)' : 'Reset'),
            ),
          ],
        ),
      ),
    );
  }
}