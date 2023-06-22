import 'package:hive/hive.dart';
import 'package:hive_database/data/model/cars_model.dart';

class CarAdapter extends TypeAdapter<CarsModel> {
  @override
  final int typeId = 0;

  @override
  CarsModel read(BinaryReader reader) {
    final name = reader.read() as String;
    final brand = reader.read() as String;
    final price = reader.read() as num;

    return CarsModel(name: name, brand: brand, price: price);
  }

  @override
  void write(BinaryWriter writer, CarsModel obj) {
    writer.write(obj.name);
    writer.write(obj.brand);
    writer.write(obj.price);
  }
}
