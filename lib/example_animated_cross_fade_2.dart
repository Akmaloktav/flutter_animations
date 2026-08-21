import 'package:flutter/material.dart';

class ExampleAnimatedCrossFade2 extends StatefulWidget {
  const ExampleAnimatedCrossFade2({super.key});

  @override
  State<ExampleAnimatedCrossFade2> createState() => _ExampleAnimatedCrossFade2State();
}

class _ExampleAnimatedCrossFade2State extends State<ExampleAnimatedCrossFade2> {
  bool _isEditing = false;

  final TextEditingController _addressController = TextEditingController(
    text: 'Jl. Sudirman No. 45, Jakarta Pusat, DKI Jakarta',
  );
  final TextEditingController _notesController = TextEditingController(
    text: 'Pagar hitam, samping minimarket.',
  );

  @override
  void dispose() {
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout Pengiriman')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alamat Tujuan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Kontainer luar kartu
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 350),
                  reverseDuration: const Duration(milliseconds: 250),
                  crossFadeState: _isEditing
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  sizeCurve: Curves.easeInOutCubic,
                  firstCurve: Curves.easeOut,
                  secondCurve: Curves.easeIn,

                  // 1. Tampilan Ringkasan (firstChild - Ukuran Lebih Pendek)
                  firstChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                              SizedBox(width: 8),
                              Text('Rumah Utama', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          TextButton(
                            onPressed: () => setState(() => _isEditing = true),
                            child: const Text('Ubah'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _addressController.text,
                        style: TextStyle(color: Colors.grey.shade800, height: 1.4),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Catatan: ${_notesController.text}',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),

                  // 2. Tampilan Form Edit (secondChild - Ukuran Lebih Panjang)
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Edit Detail Alamat',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _addressController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Alamat Lengkap',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: 'Catatan untuk Kurir (Opsional)',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => setState(() => _isEditing = false),
                            child: const Text('Batal'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () => setState(() => _isEditing = false),
                            child: const Text('Simpan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}