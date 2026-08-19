import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_align_widget.dart';
import 'package:flutter_animations/animated_container_widget.dart';
import 'package:flutter_animations/animated_opacity_widget.dart';
import 'package:flutter_animations/contoh_alignment_lerp.dart';
import 'package:flutter_animations/detail_page_with_sheet.dart';
import 'package:flutter_animations/explicit_animation.dart';
import 'package:flutter_animations/explicit_animation2.dart';
import 'package:flutter_animations/explicit_animation3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPageWithSheet(),
    );
  }
}
