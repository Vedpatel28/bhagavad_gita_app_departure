// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favorite_Page extends StatelessWidget {
  const favorite_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int indexVerses = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.transparent,
        ),
        title: const Text("Favorite verses"),
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
          child: Container(
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
                padding: const EdgeInsets.all(20),
                child: Consumer<bhagvatGitaController>(builder: (context, provider, _) {
                  bhagvatGitaJsonModals verses = provider.allVerses[indexVerses];
                  return Container(
                    height: s.height*0.02,
                    width: s.width,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: s.height*0.02,
                          width: s.width,
                          color: Colors.black,
                          child: ListView.builder(
                            itemCount: provider.favoritVerse.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(verses.textHindi),
                                subtitle: Text(verses.transliteration),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
