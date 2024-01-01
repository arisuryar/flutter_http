import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String content;
  const DialogWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AlertDialog(
            titleTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.w600),
            title: Center(
              child: Text(title),
            ),
            content: Center(
              child: Text(content),
            ),
            contentTextStyle: GoogleFonts.poppins(
                color: AppColors.primary, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
