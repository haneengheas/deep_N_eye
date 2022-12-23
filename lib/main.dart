import 'package:deep_n_eye/presentation/screens/resultScreen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/Investigations_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InvestigationsScreen(),
      ),

    );
  }
}
