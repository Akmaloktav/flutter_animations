import 'package:flutter/material.dart';

class ContohAlignmentLerp extends StatefulWidget {
  const ContohAlignmentLerp({super.key});

  @override
  State<ContohAlignmentLerp> createState() => _ContohAlignmentLerpState();
}

class _ContohAlignmentLerpState extends State<ContohAlignmentLerp> {
  // Nilai progres interpolasi (0.0 sampai 1.0)
  double _nilaiProgres = 0.0;

  // Titik awal dan titik akhir
  final Alignment _titikAwal = Alignment.topLeft;
  final Alignment _titikAkhir = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    // Menghitung posisi saat ini berdasarkan nilai progres (_nilaiProgres)
    Alignment posisiSaatIni = Alignment.lerp(
      _titikAwal,
      _titikAkhir,
      _nilaiProgres,
    )!;

    return Scaffold(
      appBar: AppBar(title: const Text('Contoh Alignment.lerp')),
      body: Column(
        children: [
          // Wadah utama yang lebih besar
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Align(
                alignment: posisiSaatIni, // Posisi dinamis hasil dari lerp
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ),
          ),
          // Slider untuk mengubah nilai 't' secara real-time
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Nilai t (Progres): ${_nilaiProgres.toStringAsFixed(2)}'),
                Slider(
                  value: _nilaiProgres,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _nilaiProgres =
                          value; // Perbarui progres saat slider digeser
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
