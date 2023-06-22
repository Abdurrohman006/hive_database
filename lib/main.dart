import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/data/adapters/car_adapter.dart';
import 'package:hive_database/ui/hive_first_example.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  // databasada vegetables nomli box create qiladi
  await Hive.openBox("vegetables");

  // Adapterri registratsiya qivotti
  Hive.registerAdapter(CarAdapter());

  await Hive.openBox("gm");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: HiveFirstExample(),
    );
  }
}
