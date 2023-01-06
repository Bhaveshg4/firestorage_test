import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:women_safe_1/homepage.dart';
import 'firebase_options.dart';
import 'package:file_picker/file_picker.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WomenSafe());
}

class WomenSafe extends StatelessWidget {
  const WomenSafe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
