import 'package:flutter/material.dart';

class DetailPageWithSheet extends StatelessWidget {
  const DetailPageWithSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Konten Utama Halaman Detail (Background / Gambar Produk)
          Positioned.fill(
            child: Image.network(
              'https://picsum.photos/800/1200',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Panel Geser Otomatis (Built-in Flutter)
          DraggableScrollableSheet(
            initialChildSize: 0.25, // Tinggi awal: 25% dari tinggi layar
            minChildSize: 0.10, // Batas minimal saat ditutup: 15% layar
            maxChildSize: 1.0, // Batas maksimal saat dibuka: 85% layar
            snap: true, // Otomatis menempel (snap) ke posisi terdekat
            snapSizes: const [0.10, 0.25, 0.5, 0.85, 1.0], // Titik berhenti (multi-step)
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                ),
                child: ListView(
                  controller:
                      scrollController, // Wajib dipasang agar gestur terhubung
                  padding: const EdgeInsets.all(16),
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nama Produk / Judul Item',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rp 450.000',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    const Divider(height: 32),
                    const Text(
                      'Deskripsi lengkap item. Widget ini otomatis menangani geseran jari, lemparan inersia, dan scroll konten di dalamnya tanpa satu baris pun kode matematika animasi.',
                      style: TextStyle(color: Colors.black87, height: 1.5),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
