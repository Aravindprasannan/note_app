import 'package:flutter/material.dart';
import 'package:note_app/essential/style.dart';
import 'package:note_app/login_screen.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoginScreen(),
    );
  }
}
