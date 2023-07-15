import 'dart:ui';
import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/controller/settings_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:bhagvat_geeta_app_departure/utilse/image_utilse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class homePage extends StatelessWidget {
  homePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
          "Bhagvat Gita",
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: s.height * 0.11),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: s.width * 1,
                          height: s.height * 0.24,
                          child: CarouselSlider(
                            items: List.generate(
                              imagesList.length,
                              (index) => Container(
                                height: s.height * 0.1,
                                width: s.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imagesList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(s.height * 0.02),
                                  ),
                                ),
                              ),
                            ),
                            options: CarouselOptions(
                              height: s.height * 0.3,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 500),
                              enlargeCenterPage: true,
                              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Chapters",
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: s.height * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: s.height * 0.6,
                    child: Consumer<bhagvatGitaController>(
                      builder: (context, provider, _) {
                        return provider.allVerses.isNotEmpty
                            ? ListView.builder(
                                itemCount: provider.allVerses.length,
                                itemBuilder: (context, index) {
                                  bhagvatGitaJsonModals verses =
                                      provider.allVerses[index];
                                  return Consumer<settingsController>(
                                    builder: (context, provider, child) =>
                                        Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, left: 10, right: 10),
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
                                          style: GoogleFonts.playfairDisplay(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: s.height * 0.035,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          verses.textHindi,
                                          style: GoogleFonts.playfairDisplay(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: s.height * 0.022,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                provider.pages[2],
                                                arguments: index);
                                          },
                                          icon: Icon(
                                            Icons.navigate_next_outlined,
                                            size: s.height * 0.04,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
