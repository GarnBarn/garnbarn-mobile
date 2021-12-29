import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/screens/home_screen.dart';
import 'package:garnbarn_mobile/services/convert_to_material_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const GarnBarn());
}

class GarnBarn extends StatelessWidget {
  const GarnBarn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GarnBarn',
      theme: ThemeData(
        primarySwatch: convertToMaterialColor(0xFFF9F9F9),
      ),
      home: const HomeScreen(),
    );
  }
}
