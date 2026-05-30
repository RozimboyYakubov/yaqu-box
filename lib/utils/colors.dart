import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color primaryBlueDark = Color(0xFF1565C0);
  
  // Secondary Colors
  static const Color accentRed = Color(0xFFE53935);
  static const Color accentGreen = Color(0xFF43A047);
  static const Color accentOrange = Color(0xFFFB8C00);
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF757575);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF424242);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryBlue, primaryBlueDark],
  );
}