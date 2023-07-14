// ignore_for_file: camel_case_types

import 'package:bhagvat_geeta_app_departure/controller/settings_controller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class list_Page extends StatelessWidget {
  const list_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list, color: Colors.transparent),
        title: const Text("List Page"),
        centerTitle: true,
      ),
      bottomNavigationBar: Consumer<settingsController>(
        builder: (context, provider, _) {
          return FlashyTabBar(
            showElevation: true,
            animationCurve: Curves.linear,
            selectedIndex: provider.currentIndex,
            onItemSelected: (value) {
              provider.changeIndex(index: value);
              Navigator.of(context)
                  .pushNamed(provider.pages[provider.currentIndex]);
            },
            items: [
              FlashyTabBarItem(
                icon: const Icon(Icons.home_filled),
                title: Text("Home", style: GoogleFonts.playfairDisplay()),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.bookmark_add_outlined),
                title: Text("Favorite", style: GoogleFonts.playfairDisplay()),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.list),
                title: Text("List", style: GoogleFonts.playfairDisplay()),
              ),
              FlashyTabBarItem(
                icon: const Icon(Icons.settings),
                title: Text("Setting", style: GoogleFonts.playfairDisplay()),
              ),
            ],
          );
        },
      ),
    );
  }
}
