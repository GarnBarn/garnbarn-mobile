import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/logo/garnbarn_horizontal_logo.png",
              fit: BoxFit.scaleDown,
              width: 150,
              height: 100,
            )
          ],
        ),
      ),
      body: const Center(
        child: Text("Test"),
      ),
    );
  }
}
