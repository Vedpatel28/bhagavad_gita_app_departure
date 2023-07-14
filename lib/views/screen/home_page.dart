import 'dart:ui';
import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/controller/settings_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:bhagvat_geeta_app_departure/utilse/image_utilse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
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
      body: NestedScrollView(
        headerSliverBuilder: (context, value) =>
        [
          SliverAppBar(
            pinned: false,
            primary: true,
            title: Text(
              "Bhagvat Gita",
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: s.height * 0.025,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
            ),
            centerTitle: true,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                (index) =>
                                Container(
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
                      fontSize: s.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: s.height * 0.6,
                  child: Consumer<bhagvatGitaController>(
                      builder: (context, provider, _) {
                        return provider.allVerses.isEmpty ? ListView.builder(
                          itemCount: provider.allVerses.length,
                          itemBuilder: (context, index) {
                            bhagvatGitaJsonModals verses = provider.allVerses[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.primaries[index % 18],
                                ),
                                title: Text(verses.name),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.navigate_next_outlined,
                                  ),
                                ),
                              ),
                            );
                          },
                        ) : const Center(child: CircularProgressIndicator(),);
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
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

/*


      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.home, color: Colors.transparent),
        title: Text(
          "Bhagvat Gita",
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: s.height * 0.025,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

* */
