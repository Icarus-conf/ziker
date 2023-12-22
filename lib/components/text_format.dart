import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmiriText extends StatelessWidget {
  final String text;
  final double fontS;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? letterSpacing;

  const AmiriText({
    super.key,
    required this.text,
    required this.fontS,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.amiri(
        fontSize: fontS,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
