import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  const CustomFont(
      {Key? key, required this.text, this.size, this.color, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont('Roboto',
          color: color ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: size ?? 16),
    );
  }
}
