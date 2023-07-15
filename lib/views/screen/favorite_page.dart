// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class favorite_Page extends StatelessWidget {
  const favorite_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.bookmark,color: Colors.transparent,),
        title: const Text("Favorite Page"),
        centerTitle: true,
      ),
    );
  }
}