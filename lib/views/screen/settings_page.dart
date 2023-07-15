import 'package:flutter/material.dart';

class settings_page extends StatelessWidget {
  const settings_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings, color: Colors.transparent),
        title: const Text("settings Page"),
        centerTitle: true,
      ),
    );
  }
}