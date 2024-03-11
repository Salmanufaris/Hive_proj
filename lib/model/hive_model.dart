import 'package:hive_flutter/hive_flutter.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String firstname;

  @HiveField(3)
  final String lastname;

  @HiveField(4)
  final String image;

  EmployeeModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.image,
  });
}
