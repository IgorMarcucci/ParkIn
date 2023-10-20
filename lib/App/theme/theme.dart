import 'package:flutter/material.dart';
import 'package:flutter_app/App/Theme/custom_theme.dart';
import 'package:flutter_app/App/Theme/custom_theme_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() => ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        onPrimary: const Color.fromARGB(255, 0, 0, 0),
        primary: const Color.fromARGB(255, 0, 0, 0),
        seedColor: const Color.fromARGB(255, 0, 0, 0),
        secondary: const Color.fromARGB(255, 255, 255, 255),
        brightness: Brightness.light,
      ),
      extensions: <ThemeExtension<dynamic>>[
        CustomTheme(
          buttonColor: const Color.fromARGB(255, 50, 50, 50),
          paletteDecoration: const BoxDecoration(
            color: Color.fromARGB(255, 242, 242, 242),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 56, 56, 56),
                offset: Offset(0, -4),
                blurRadius: 15.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
          ),
          textstyles: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),
          textstylesTitle: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),
          textstylesTitleRodape: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 26,
              color: Color.fromARGB(255, 56, 56, 56),
            ),
          ),
          textStylesButton: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          decorationbox: const BoxDecoration(
            color: Color.fromARGB(255, 232, 232, 232),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(82, 58, 58, 58),
                offset: Offset(2, 2),
                blurRadius: 6.0,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          decorationfloating: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(144, 17, 17, 17),
                  offset: Offset(2, 3),
                  blurRadius: 7.0,
                  blurStyle: BlurStyle.normal)
            ],
          ),
          imageBackground: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fundo.png'),
              fit: BoxFit.fill,
            ),
          ),
          inText: GoogleFonts.passionOne(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 170, 5, 5),
              fontSize: 78,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1, 3.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(162, 0, 0, 0),
                ),
              ],
            ),
          ),
          parkText: GoogleFonts.passionOne(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 78,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1, 3.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(162, 0, 0, 0),
                ),
              ],
            ),
          ),
          lineTextParkIn: GoogleFonts.passionOne(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1, 4.0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(162, 0, 0, 0),
                ),
              ],
            ),
          ),
          decorationButton: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/FUNDOR.png'),
              fit: BoxFit.fill,
            ),
          ),
          decorationBoxRodape: BoxDecoration(
            color: const Color.fromARGB(255, 214, 214, 214),
            border: Border.all(width: 0.5),
          ),
          decorationContainer: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 219, 219, 219),
                Color.fromARGB(255, 184, 184, 184),
              ],
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(144, 17, 17, 17),
                  offset: Offset(2, 3),
                  blurRadius: 7.0,
                  blurStyle: BlurStyle.normal)
            ],
          ),
          imageDrawer: const BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              image: AssetImage('assets/fundinho.png'),
              fit: BoxFit.fill,
            ),
          ),
          textDrawer: GoogleFonts.josefinSlab(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 26, 26, 26),
            ),
          ),
        ),
        CustomThemeColors(dividerColor: Colors.black87)
      ],
    );
