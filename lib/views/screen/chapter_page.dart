// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class list_Page extends StatelessWidget {
  const list_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int fromIndex = ModalRoute.of(context)!.settings.arguments as int;
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
                  bhagvatGitaJsonModals verses = provider.allVerses[fromIndex];
                  return Column(
                    children: [
                      SizedBox(height: s.height * 0.1),
                      Text(
                        "CHAPTER ${fromIndex + 1}",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: s.height * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(height: s.height * 0.01),
                      SizedBox(
                        height: s.height * 0.78,
                        child: Consumer<bhagvatGitaController>(
                            builder: (context, provider, _) {
                          return provider.allVerses.isNotEmpty
                              ? ListView.builder(
                                  itemCount:
                                      verses.chapter_number == fromIndex + 1
                                          ? provider.allVerses.length
                                          : null,
                                  itemBuilder: (context, index) {
                                    bhagvatGitaJsonModals verses =
                                        provider.allVerses[fromIndex];
                                    return verses.chapter_number ==
                                            fromIndex + 1
                                        ? Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 10,
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNMxXFnb8AdzJZcLfPMa4GcuvsjvHffrIn2g&usqp=CAU",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: ListTile(
                                              leading: Text(
                                                "${verses.chapter_number}",
                                                style:
                                                    GoogleFonts.playfairDisplay(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: s.height * 0.035,
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                verses.textHindi,
                                                style:
                                                    GoogleFonts.playfairDisplay(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: s.height * 0.022,
                                                  ),
                                                ),
                                              ),
                                              trailing: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    AllRoutes.listOfVerse,
                                                    arguments: index,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.navigate_next_outlined,
                                                  size: s.height * 0.04,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ))
                                        : Container();
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        }),
                      ),
                      SizedBox(height: s.height * 0.02),
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
