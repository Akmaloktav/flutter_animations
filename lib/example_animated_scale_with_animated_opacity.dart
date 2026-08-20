import 'package:flutter/material.dart';

class ExampleAnimatedScaleWithAnimatedOpacity extends StatefulWidget {
  const ExampleAnimatedScaleWithAnimatedOpacity({super.key});

  @override
  State<ExampleAnimatedScaleWithAnimatedOpacity> createState() => _ExampleAnimatedScaleWithAnimatedOpacityState();
}

class _ExampleAnimatedScaleWithAnimatedOpacityState extends State<ExampleAnimatedScaleWithAnimatedOpacity> {
  bool _isDialogVisible = false;

  void _toggleDialog() {
    setState(() {
      _isDialogVisible = !_isDialogVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Pop-In Dialog')),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: _toggleDialog,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Tampilkan Dialog'),
            ),
          ),

          // Membuat layar redup dan memberikan ignorepointer agar ketika dialog muncul dapat di cancel dengan menekan area dimanapun selain itu memblokir memunculkan dialog selain di tombol tampilkan dialog
          IgnorePointer(
            ignoring: !_isDialogVisible,
            child: AnimatedOpacity(
              opacity: _isDialogVisible ? 0.6 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: _toggleDialog, // Ketuk di luar untuk menutup
                child: Container(color: Colors.black),
              ),
            ),
          ),

          // Dialog
          IgnorePointer(
            // ignore pointer membuat komponen diatasnya tidak menutup/memblokir komponen dibawahnya dalam hal ini tombol tampilkan dialog dapat diketuk
            ignoring:
                !_isDialogVisible, // Biarkan sentuhan tembus jika dialog tersembunyi
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                // 1. AnimatedOpacity (Handling Transparansi)
                child: AnimatedOpacity(
                  opacity: _isDialogVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic, // Halus saat masuk
                  // 2. AnimatedScale (Handling Ukuran)
                  child: AnimatedScale(
                    // Dialog mulai dari skala 0.8 saat hilang, membesar ke 1.0
                    scale: _isDialogVisible ? 1.0 : 0.8,
                    duration: const Duration(milliseconds: 400),
                    // Curves.easeOutBack memberikan sedikit efek membal (pop)
                    curve: _isDialogVisible
                        ? Curves.easeOutBack
                        : Curves.easeInCubic,

                    // konten dialog
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.verified,
                            size: 60,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Proses Berhasil!',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Transaksi Anda telah kami proses dengan aman. Terima kasih!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _toggleDialog,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Tutup'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
