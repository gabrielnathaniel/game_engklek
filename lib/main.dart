import 'package:engklek_game/screens/main_menu.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: MainMenu(),
    ),
  );
}
