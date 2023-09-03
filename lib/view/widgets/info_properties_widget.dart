import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ne_ekiyo/utils/constants.dart';

@override
Widget infoProperties(int index, IconData icon, Color iconColor, String dataa) {
  String dataText = "";

  switch (dataa) {
    case "dirt":
      dataText = "toprak miktarı";
      break;
    case "water":
      dataText = "su miktarı";
      break;
    case "time":
      dataText = "sulama sıklığı";
      break;
    case "fertilizer":
      dataText = "gübre miktarı";
  }

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 50,
            color: iconColor,
          ),
          Text(
            "Bir kilo ${data["$index"]["name"]} için gerekli \n$dataText ",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "${data["$index"][dataa]}\t${dataa != "time" ? "kg" : "gün"}",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      const Divider(thickness: 1),
    ],
  );
}
