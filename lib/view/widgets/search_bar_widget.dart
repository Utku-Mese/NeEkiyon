import 'package:flutter/material.dart';
import 'package:ne_ekiyo/utils/constants.dart';

class MySearcBar extends StatefulWidget {
  const MySearcBar({super.key});

  @override
  State<MySearcBar> createState() => _MySearcBarState();
}

class _MySearcBarState extends State<MySearcBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: BorderRadius.circular(11),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Yetiştirdiğiniz ürünü arayın..",
          fillColor: Colors.transparent,
          prefixIcon: Icon(Icons.filter_alt_rounded),
          suffixIcon: Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}
