import 'package:flutter/material.dart';

Widget smallPlantCard(
    {String imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHip084wdsKhAUgNTucCWmVXJwFAgb2kc2cg&usqp=CAU"}) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(33),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 4),
          blurRadius: 4,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(33),
      child: Image.network(
        imageUrl,
      ),
    ),
  );
}
