import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _statusAktif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _statusAktif = !_statusAktif;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 500),
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.decelerate,
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              alignment: Alignment.bottomLeft,
              child: FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  alignment: Alignment.centerLeft,
                  child: child,
                ),
              ),
            );
          },
          child: _statusAktif
              ? Container(
                  // key: ValueKey(1),
                  width: 150,
                  height: 150,
                  color: Colors.redAccent,
                  child: Center(
                    child: Text('Aktif', style: TextStyle(color: Colors.white)),
                  ),
                )
              :
                // Container(
                //     key: ValueKey(2),
                //     width: 150,
                //     height: 150,
                //     color: Colors.blueAccent,
                //     child: Center(
                //       child: Text('Mati', style: TextStyle(color: Colors.white)),
                //     ),
                //   ),
                FlutterLogo(
                  size: 100,
                ), // Jika ingin tanpa menggunakan key, usahakan widget tidak sama
        ),
      ),
    );
  }
}
