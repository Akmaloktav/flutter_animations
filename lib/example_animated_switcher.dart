import 'package:flutter/material.dart';

class ExampleAnimatedSwitcher extends StatefulWidget {
  const ExampleAnimatedSwitcher({super.key});

  @override
  State<ExampleAnimatedSwitcher> createState() => _ExampleAnimatedSwitcherState();
}

class _ExampleAnimatedSwitcherState extends State<ExampleAnimatedSwitcher> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSwitcher Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Jumlah Notifikasi Baru:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // AnimatedSwitcher menangani pergantian angka
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              // transitionBuilder untuk mengubah animasi default Fade menjadi Scale + Fade
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              // ValueKey wajib diberikan agar Flutter tahu konten Text berubah
              child: Container(
                key: ValueKey<int>(_counter),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: _counter == 0 ? Colors.grey.shade400 : Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}