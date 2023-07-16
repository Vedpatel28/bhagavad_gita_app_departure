import 'dart:ui';
import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:bhagvat_geeta_app_departure/utilse/image_utilse.dart';
import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class homePage extends StatelessWidget {
  homePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery
        .of(context)
        .size;
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
                  // CarouselSlider Images
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
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
                  // Chapters
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
                  SizedBox(height: s.height * 0.02),
                  // Index of Chapters
                  SizedBox(
                    height: s.height * 0.55,
                    child: Consumer<bhagvatGitaController>(
                      builder: (context, provider, _) {
                        return provider.allVerses.isNotEmpty
                            ? ListView.builder(
                          itemCount: 18,
                          itemBuilder: (context, index) {
                            bhagvatGitaJsonModals verses =
                            provider.allVerses[index];
                            return Container(
                              height: s.height * 0.06,
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
                              child: Row(
                                children: [
                                  SizedBox(width: s.width * 0.02),
                                  Text(
                                    "Chapters : ${index + 1}",
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: s.height * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          AllRoutes.listOfChapter,
                                          arguments: index
                                      );
                                      const Text("________________------------------------------------_________________");
                                    },
                                    icon: Icon(
                                      Icons.navigate_next_outlined,
                                      color: Colors.white,
                                      size: s.height * 0.035,
                                    ),
                                  ),
                                ],
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