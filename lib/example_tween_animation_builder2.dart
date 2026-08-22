import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExampleTweenAnimationBuilder2 extends StatefulWidget {
  const ExampleTweenAnimationBuilder2({super.key});

  @override
  State<ExampleTweenAnimationBuilder2> createState() => _ExampleTweenAnimationBuilder2State();
}

class _ExampleTweenAnimationBuilder2State extends State<ExampleTweenAnimationBuilder2> {
  double _balance = 1250000;

  void _addTopUp() {
    setState(() {
      _balance += 500000; // Saldo bertambah Rp 500.000
    });
  }

  @override
  Widget build(BuildContext context) {
    // Formatter mata uang Indonesia
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard E-Wallet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Saldo Aktif',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  // TweenAnimationBuilder untuk interpolasi nilai angka saldo
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: _balance),
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, double value, child) {
                      return Text(
                        currencyFormat.format(value),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: _addTopUp,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Isi Saldo (+ Rp 500.000)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}