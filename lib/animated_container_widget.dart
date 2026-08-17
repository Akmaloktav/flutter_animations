import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  int? _selectedIndex; // buat variabel penampung sebagai acuan perbandingan atau menyimpan index aktif

  void ubahTampilan(int index) {
    setState(() {
      // Jika item diklik yang sama lagi maka kembalikan ke kondisi normal
      // isi variabel penampung tersebut dengan nilai berdasarkan kondisi, jika isi dari variabel penampung sama dengan parameter index, maka variabel penampung diisi kembali dengan null. Jika tidak maka isi dengan nilai milik index. Sambil mengisi juga lakukan perubahan state
      _selectedIndex = (_selectedIndex == index) ? null : index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          // Cek apakah item sedang aktif
          // definisikan status terpilih jika nilai variabel penampung sama dengan index
          final bool isSelected = _selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => ubahTampilan(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: isSelected ? 200 : 150,
                height: isSelected ? 200 : 150,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey,
                  borderRadius: isSelected
                      ? BorderRadius.circular(8)
                      : BorderRadius.circular(0),
                ),
                curve: Curves.easeIn,
                onEnd: isSelected
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil melakukan perubahan"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    : null,
                child: Center(child: Text("${index}")),
              ),
            ),
          );
        },
      ),
    );
  }
}
