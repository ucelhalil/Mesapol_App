import 'package:flutter/material.dart';

void main() {
  runApp(const MesaApp());
}

class MesaApp extends StatelessWidget {
  const MesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mesapol Analytics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

