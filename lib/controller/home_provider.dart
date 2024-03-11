// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/hive_model.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:flutter_application_1/service/api_service.dart';
import 'package:hive/hive.dart';

class Homeprovider extends ChangeNotifier {
  List<Model> noteList = [];

  Future<List<Model>> loadnotes() async {
    try {
      List<Model> notes = await Apiservice().fetchApi();
      noteList = notes;
    } catch (error) {
      print("Error loading notes: $error");
    }
    return noteList;
  }

  Future<List<EmployeeModel>> getAllEmployee() async {
    final employeeDB = await Hive.openBox<EmployeeModel>('favorites');
    return employeeDB.values.toList();
  }

  Future<void> addToFavorites(Model item) async {
    try {
      var box = await Hive.openBox<Model>('favorites');
      await box.put(item.id, item);
      print('Item added to favorites: ${item.id}');
    } catch (error) {
      print('Error adding item to favorites: $error');
    }
  }
}
