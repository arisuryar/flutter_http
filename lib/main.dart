import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: AppColors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
