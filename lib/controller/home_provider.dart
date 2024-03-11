// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/hive_model.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:flutter_application_1/service/api_service.dart';

class Homeprovider extends ChangeNotifier {
  ValueNotifier<List<EmployeeModel>> favouriteNotifier = ValueNotifier([]);
  List<EmployeeModel> favoriteItems = [];
  List<Model> noteList = [];
  final Apiservice apiservice = Apiservice();

  Future<List<Model>> loadnotes() async {
    try {
      List<Model> notes = await Apiservice().fetchApi();
      noteList = notes;
    } catch (error) {
      print("Error loading notes: $error");
    }
    return noteList;
  }

  Future<void> getAllFavourite() async {
    favoriteItems = await apiservice.getAllFavourite();
    notifyListeners();
  }

  addToFavourite(EmployeeModel data, context) async {
    await apiservice.addToFavourite(data);
    bool isAlreadyInFavorites = favoriteItems.contains(data);
    if (!isAlreadyInFavorites) {}
    getAllFavourite();
    notifyListeners();
  }
}
