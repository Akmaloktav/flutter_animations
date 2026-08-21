import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _tampilanAnimasiPertama = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedCrossFade(
            //   firstChild: Container(
            //     width: 150,
            //     height: 150,
            //     color: Colors.blue,
            //     child: Center(
            //       child: Text(
            //         "Kotak biru",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            //   secondChild: Container(
            //     margin: EdgeInsets.all(8),
            //     width: 200,
            //     height: 200,
            //     decoration: BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: BorderRadius.circular(100),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black54,
            //           offset: Offset(1.0, 1.0),
            //           blurRadius: 0.5,
            //           spreadRadius: 1.0
            //         ),
            //       ],
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Kotak merak",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            //   crossFadeState: _tampilanAnimasiPertama
            //       ? CrossFadeState.showFirst
            //       : CrossFadeState.showSecond,
            //   duration: Duration(milliseconds: 500),
            //   firstCurve: Curves.bounceInOut,
            //   secondCurve: Curves.easeInCubic,
            //   alignment: Alignment.centerRight,
            //   sizeCurve: Curves.decelerate,
            //   reverseDuration: Duration(milliseconds: 500),

            // ),
            // Contoh kustomisasi layoutBuilder agar kedua anak diposisikan di tengah
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _tampilanAnimasiPertama
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const Text('Tampilan Pertama'),
              secondChild: const Text('Tampilan Kedua yang Lebih Panjang'),
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(key: bottomChildKey, child: bottomChild),
                        Positioned(key: topChildKey, child: topChild),
                      ],
                    );
                  },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _tampilanAnimasiPertama = !_tampilanAnimasiPertama;
                });
              },
              child: Text("Tekan"),
            ),
          ],
        ),
      ),
    );
  }
}
