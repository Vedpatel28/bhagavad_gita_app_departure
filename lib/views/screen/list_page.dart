// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class list_Page extends StatelessWidget {
  const list_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromindex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.list, color: Colors.transparent),
        title: Text(
          "",
          style: GoogleFonts.chakraPetch(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: s.height * 0.03,
              letterSpacing: 1,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Consumer<bhagvatGitaController>(
                builder: (context, provider, _) {
                  bhagvatGitaJsonModals verses = provider.allVerses[fromindex];
                  return Column(
                    children: [
                      SizedBox(height: s.height * 0.2),
                      Container(
                        child: Text(
                          "CHAPTER ${verses.chapter_number} \n\n  Verses ${verses.verses_count}",
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: s.height * 0.022,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: s.height * 0.1),
                      Container(
                        height: s.height * 0.2,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/free-photo/brown-wooden-flooring_53876-90802.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          verses.textHindi,
                          style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: s.height * 0.022,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: s.height * 0.02),
                      Container(
                        height: s.height * 0.2,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/free-photo/brown-wooden-flooring_53876-90802.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Text(
                          verses.transliteration,
                          style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: s.height * 0.022,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
