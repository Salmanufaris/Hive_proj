import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/hive_model.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:hive/hive.dart';

class Apiservice {
  Dio dio = Dio();
  final url = "https://reqres.in/api/users?page=2";

  Future<List<Model>> fetchApi() async {
    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        var jsonList = response.data['data'] as List;

        List<Model> notes = jsonList.map((json) {
          return Model.fromJson(json);
        }).toList();
        return notes;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      throw Exception("Failed to fetch data: $error");
    }
  }

  Future<List<EmployeeModel>> getAllFavourite() async {
    final favoriteBox = await Hive.openBox<EmployeeModel>('favorites');
    return favoriteBox.values.toList();
  }

  Future<void> addToFavourite(EmployeeModel data) async {
    final favoriteBox = await Hive.openBox<EmployeeModel>('favorites');
    await favoriteBox.add(data);
  }
}
