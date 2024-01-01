import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemGridView extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ItemGridView({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.light,
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
