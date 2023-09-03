import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget propertiesRow(String text, IconData icon, Color iconColor) {
  return Row(
    children: [
      Icon(
        icon,
        size: 30,
        color: iconColor,
      ),
      Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}
