import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class CarsModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(0)
  String brand;
  @HiveField(1)
  num price;

  CarsModel({
    required this.brand,
    required this.name,
    required this.price,
  });
}
