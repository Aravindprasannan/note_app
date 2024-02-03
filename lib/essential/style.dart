import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/essential/color.dart';
import 'package:note_app/essential/size.dart';

ThemeData darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
  scaffoldBackgroundColor: darkBgColor,
  primaryColor: darkTextThemeAndPrimaryColor,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.openSans(
        fontSize: fsz32,
        color: darkTextThemeAndPrimaryColor,
        fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.openSans(
        fontSize: fsz16, color: darkTextThemeAndPrimaryColor),
    titleMedium: GoogleFonts.openSans(
        fontSize: fsz14, color: darkTextThemeAndPrimaryColor),
    titleSmall: GoogleFonts.openSans(
        fontSize: fsz12, color: darkTextThemeAndPrimaryColor),
  ),
);

ThemeData lightTheme = ThemeData.light(useMaterial3: false).copyWith(
  scaffoldBackgroundColor: lightBgColor,
  primaryColor: lightTextThemeAndPrimaryColor,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.openSans(
        fontSize: fsz32,
        color: lightTextThemeAndPrimaryColor,
        fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.openSans(
        fontSize: fsz16, color: lightTextThemeAndPrimaryColor),
    titleMedium: GoogleFonts.openSans(
        fontSize: fsz14, color: lightTextThemeAndPrimaryColor),
    titleSmall: GoogleFonts.openSans(
        fontSize: fsz12, color: lightTextThemeAndPrimaryColor),
  ),
);

InputDecoration decoration(BuildContext context, String content) {
  return InputDecoration(
    fillColor: textFieldColor,
    hintText: content,
    errorStyle:
        Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
    hintStyle:
        Theme.of(context).textTheme.titleLarge?.copyWith(color: lightTextColor),
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0), borderSide: BorderSide.none),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),
  );
}
