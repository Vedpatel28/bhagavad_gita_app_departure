// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class verse_page extends StatelessWidget {
  verse_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: s.height * 0.032,
            color: Colors.white,
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
                    SizedBox(height: s.height * 0.15),
                    Text(
                      "Verse Of ${verses.chapter_number}.${verses.verses_count}",
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: s.height * 0.03,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.03),
                    Container(
                      height: s.height * 0.3,
                      width: s.width,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNMxXFnb8AdzJZcLfPMa4GcuvsjvHffrIn2g&usqp=CAU",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // SizedBox(height: s.height * 0.07),
                          Text(
                            verses.textHindi,
                            style: GoogleFonts.nobile(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: s.height * 0.028,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                provider.addFavoritList(index: fromIndex);
                                Navigator.of(context).pushNamed(
                                  AllRoutes.favoritePage,
                                  arguments: fromIndex,
                                );
                              },
                              icon: Icon(
                                Icons.favorite_outline,
                                size: s.height * 0.04,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: s.height * 0.03),
                    Container(
                      height: s.height * 0.3,
                      width: s.width,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNMxXFnb8AdzJZcLfPMa4GcuvsjvHffrIn2g&usqp=CAU",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            verses.transliteration,
                            style: GoogleFonts.nobile(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: s.height * 0.022,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                provider.addFavoritList(index: fromIndex);
                                Navigator.of(context).pushNamed(
                                  AllRoutes.favoritePage,
                                  arguments: fromIndex,
                                );
                              },
                              icon: Icon(
                                Icons.favorite_outline,
                                size: s.height * 0.04,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
