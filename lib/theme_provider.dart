import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }


  ThemeData get themeData {
    return _isDarkTheme
        ? ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.lightBlueAccent,
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: Colors.lightBlueAccent[400]),
          unselectedIconTheme: const IconThemeData(color: Colors.grey)
      ),
      textTheme: TextTheme(

        displaySmall: const TextStyle(
          color:Colors.white,
          fontSize: 12,
          fontFamily: "assets/fonts/",
        ),
        headlineLarge: TextStyle(
            color:Colors.lightBlueAccent[400],
            fontSize: 16,
            fontFamily: "assets/fonts/",
            fontWeight: FontWeight.bold
        ),
        headlineMedium: TextStyle(
            color:Colors.lightBlueAccent[400],
            fontSize: 16,
            fontFamily: "assets/fonts/",
            fontWeight: FontWeight.bold
        ),
        headlineSmall: TextStyle(
          color:Colors.lightBlueAccent[400],
          fontSize: 12,
          fontFamily: "assets/fonts/",
        ),
        titleLarge: const TextStyle(
          color:Colors.black87,
          fontSize: 24,
          fontFamily: "assets/fonts/",
        ),
        titleMedium:const TextStyle(
            color:Colors.black87,
            fontSize: 16,
            fontFamily: "assets/fonts/",
            fontWeight: FontWeight.bold
        ),
        titleSmall: const TextStyle(
          color:Colors.black87,
          fontSize: 12,
          fontFamily: "assets/fonts/",
        ),

        labelLarge: const TextStyle(
          color:Colors.black54,
          fontSize: 24,
          fontFamily: "assets/fonts/",
        ),
        labelMedium: TextStyle(
          color:Colors.lightBlueAccent[400],
          fontSize: 16,
          fontFamily: "assets/fonts/",
        ),
        labelSmall: const TextStyle(
          color:Colors.black54,
          fontSize: 12,
          fontFamily: "assets/fonts/",
        ),
      ),
    )
        : ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF01031A),
            fontSize: 16,
            fontFamily: "assets/fonts/clashdisplay_medium.otf",
            fontWeight: FontWeight.w500
            ),
              bodyMedium: TextStyle(
              color: Color(0xFF01031A),
              fontSize: 14,
              fontFamily: "assets/fonts/clashdisplay_medium.otf",
              fontWeight: FontWeight.w500
          ),
        bodySmall: TextStyle(
          color: Color(0xFF01031A),
          fontSize: 12,
          fontFamily: "assets/fonts/clashdisplay_light.otf",
        ),
        displayLarge: TextStyle(
          color:Color(0xFF01031A),
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: "assets/fonts/clashdisplay_semibold.otf",
        ),
        displayMedium: TextStyle(
            color:Color(0xFF105341),
            fontSize: 16,
            decoration: TextDecoration.underline, // Adds underline
            fontFamily: "assets/fonts/clashdisplay_semibold.otf",
            fontWeight: FontWeight.w600
        ),
        displaySmall: TextStyle(
          color:Color(0xFFFF0000),
          fontSize: 12,
          fontFamily: "assets/fonts/clashdisplay_medium.otf",
        ),
        headlineLarge: TextStyle(
            color:Color(0xFF01031A),
            fontSize: 18,
            fontFamily: "assets/fonts/clashdisplay_medium.otf",
            fontWeight: FontWeight.w500
        ),
        headlineMedium: TextStyle(
            color:Color(0xFF01031A),
            fontSize: 16,
            fontFamily: "assets/fonts/clashdisplay_semibold.otf",
            fontWeight: FontWeight.w600
        ),
        headlineSmall: TextStyle(
          color:Color(0xFF3ACE01),
          fontSize: 12,
          fontFamily: "assets/fonts/clashdisplay_light.otf",
        ),
        titleLarge: TextStyle(
            color:Color(0xFF01031A),
            fontSize: 22,
            fontFamily: "assets/fonts/clashdisplay_semibold.otf",
            fontWeight: FontWeight.w500
        ),
        titleMedium: TextStyle(
          color: Color(0xFF01031A),
          fontSize: 12,
          fontFamily: "assets/fonts/clashdisplay_regular.otf",
        ),
        titleSmall: TextStyle(
            color:Color(0xFF999898),
            fontSize: 12,
            fontFamily: "assets/fonts/clashdisplay_regular.otf",
        ),
        labelLarge: TextStyle(
          color:Color(0xFF01031A),
          fontSize: 14,
          fontFamily: "assets/fonts/clashdisplay_regular.otf",
        ),
        labelMedium: TextStyle(
          color:Color(0xFFFFFFFF),
          fontSize: 18,
          fontFamily: "assets/fonts/Inter_18pt-Bold.ttf",
        ),
        labelSmall: TextStyle(
            color:Color(0xFF01031A),
            fontSize: 12,
            fontFamily: "assets/fonts/RedHatDisplay-Medium.ttf",
        ),
      ),
    );
  }
}