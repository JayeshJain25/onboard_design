import 'package:flutter/material.dart';
import 'package:onboard_design/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: const Color(0xFF01b192))),
      home: const OnBoardScreen(),
    );
  }
}
