import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const FirebaseAuthApp());
}

class FirebaseAuthApp extends StatelessWidget {
  const FirebaseAuthApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home:  LoginPage(),
    );
  }
}

