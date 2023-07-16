import 'package:bhagvat_geeta_app_departure/controller/bhagvat_geeta_controller.dart';
import 'package:bhagvat_geeta_app_departure/controller/settings_controller.dart';
import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:bhagvat_geeta_app_departure/views/screen/favorite_page.dart';
import 'package:bhagvat_geeta_app_departure/views/screen/home_page.dart';
import 'package:bhagvat_geeta_app_departure/views/screen/chapter_page.dart';
import 'package:bhagvat_geeta_app_departure/views/screen/settings_page.dart';
import 'package:bhagvat_geeta_app_departure/views/screen/verse_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => settingsController(pref: pref),
        ),
        ChangeNotifierProvider(
          create: (context) => bhagvatGitaController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Provider.of<settingsController>(context).getTheme
            ? Brightness.dark
            : Brightness.light,
      ),
      routes: {
        AllRoutes.homePage: (context) => homePage(),
        AllRoutes.favoritePage: (context) => favorite_Page(),
        AllRoutes.listOfChapter: (context) => list_Page(),
        AllRoutes.listOfVerse: (context) => verse_page(),
        AllRoutes.settingsPage: (context) => settings_page(),
      },
    );
  }
}
