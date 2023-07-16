import 'dart:ui';

import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class verse_page extends StatelessWidget {
  const verse_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.apps_rounded,
            size: s.height * 0.032,
            color: Colors.transparent,
          ),
        ),
        title: Text(
          "Verse",
          style: GoogleFonts.chakraPetch(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: s.height * 0.03,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://wallpaperaccess.com/full/2796591.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Consumer<bhagvatGitaController>(
                builder: (context, provider, _) {
              bhagvatGitaJsonModals verses = provider.allVerses[fromIndex];
              return Column(
                children: [
                  SizedBox(height: s.height * 0.1),
                  Text(
                    "Verse Of ${verses.chapter_number}.${verses.verses_count}",
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: s.height * 0.04,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
