import 'package:flutter/material.dart';

enum OrderStatus {
  pending('Menunggu Konfirmasi Resto', Icons.access_time_filled, Colors.amber),
  cooking('Pesanan Sedang Dimasak', Icons.soup_kitchen, Colors.orange),
  onTheWay('Driver Sedang Mengantar', Icons.delivery_dining, Colors.blue),
  completed('Pesanan Telah Tiba', Icons.check_circle, Colors.green);

  final String label;
  final IconData icon;
  final MaterialColor color;

  const OrderStatus(this.label, this.icon, this.color);
}

class ExampleAnimatedSwitcher2 extends StatefulWidget {
  const ExampleAnimatedSwitcher2({super.key});

  @override
  State<ExampleAnimatedSwitcher2> createState() =>
      _ExampleAnimatedSwitcher2State();
}

class _ExampleAnimatedSwitcher2State extends State<ExampleAnimatedSwitcher2> {
  int _currentStepIndex = 0;

  void _nextStatus() {
    setState(() {
      _currentStepIndex = (_currentStepIndex + 1) % OrderStatus.values.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = OrderStatus.values[_currentStepIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Status Pesanan Makanan')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Kartu Status Dinamis
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status Terkini:',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),

                  // AnimatedSwitcher menangani pergantian status
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    switchInCurve: Curves.easeOutBack,
                    switchOutCurve: Curves.easeInQuad,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          // Kombinasi Efek: Slide vertikal + Fade halus
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.3),
                              end: Offset.zero,
                            ).animate(animation),
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                    // ValueKey(status) memberi tahu Flutter bahwa widget telah berganti
                    child: Row(
                      key: ValueKey<OrderStatus>(status),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: status.color.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            status.icon,
                            color: status.color.shade700,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                status.label,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Estimasi: ~15 menit',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Tombol Simulasi Perubahan Data
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _nextStatus,
                icon: const Icon(Icons.fast_forward),
                label: const Text('Simulasikan Status Berikutnya'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
