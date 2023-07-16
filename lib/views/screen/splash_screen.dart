// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:ui';

import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class bhagvat_gita_splash_page extends StatelessWidget {
  const bhagvat_gita_splash_page({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed(AllRoutes.homePage);
      timer.cancel();
    });
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Spacer(flex: 1),
                // SizedBox(height: s.height * 0.02),
                Text(
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
                SizedBox(height: s.height * 0.02),
                Container(
                  height: s.height * 0.3,
                  width: s.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.black54),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgMkGtJ1nS9EhiXhQdRWusK_Rad1s5YXv8Hg&usqp=CAU",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                LoadingAnimationWidget.fallingDot(
                  color: Colors.white,
                  size: 120,
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
