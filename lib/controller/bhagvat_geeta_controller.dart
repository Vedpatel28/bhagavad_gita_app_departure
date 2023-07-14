// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:bhagvat_geeta_app_departure/modals/bhagvat_geeta_modals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class bhagvatGitaController extends ChangeNotifier {
  List<bhagvatGitaJsonModals> allVerses = [];

  bhagvatGitaController() {
    loadJSON();
  }

  void loadJSON() async {
    String res = await rootBundle.loadString('assets/json/bhagvat_geeta.json');

    List allchapter = jsonDecode(res);

    allVerses = allchapter
        .map((e) => bhagvatGitaJsonModals.fromMap(verses: e))
        .toList();

    notifyListeners();
  }
}
