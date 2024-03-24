import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/tictac.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Tic Tac Toe',
      theme: ThemeData(fontFamily: 'cv'),
      home: TicTacToe(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
    );
  }
}

