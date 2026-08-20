import 'package:flutter/material.dart';

class ExampleAnimatedPositinedWidget extends StatefulWidget {
  const ExampleAnimatedPositinedWidget({super.key});

  @override
  State<ExampleAnimatedPositinedWidget> createState() =>
      _ExampleAnimatedPositinedWidgetState();
}

class _ExampleAnimatedPositinedWidgetState
    extends State<ExampleAnimatedPositinedWidget> {
  bool _isExpanded = false;

  void toggleSheet() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Layer paling bawah mensimulasikan tampilan peta
          Container(
            color: Colors.grey.shade200,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Peta Navigasi',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),

          // Layer atas berbentuk kartu yang mensimulasikan posisi driver
          AnimatedPositioned(
            left: 16,
            right: 16,
            bottom: _isExpanded ? 24 : 16,
            height: _isExpanded ? 320 : 110,
            duration: Duration(milliseconds: 320),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () => toggleSheet(),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Budi Santoso',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Toyota Avanza • B 1234 XYZ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _isExpanded ? 'Tutup' : 'Detail',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      // Konten tambahan ketika kartu dimuat penuh
                      if (_isExpanded) ...[
                        Divider(height: 32),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.green),
                            SizedBox(width: 8),
                            Expanded(child: Text('Tiba dalam ~4 menit (1.2 km)')),
                          ],
                        ),
                        SizedBox(height: 120,),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.call),
                                label: const Text('Hubungi'),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.chat),
                                label: const Text('Chat Driver'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
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
