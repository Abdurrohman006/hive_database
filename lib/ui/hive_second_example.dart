import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/data/model/cars_model.dart';

class HiveSecondExample extends StatefulWidget {
  const HiveSecondExample({Key? key}) : super(key: key);

  @override
  State<HiveSecondExample> createState() => _HiveSecondExampleState();
}

class _HiveSecondExampleState extends State<HiveSecondExample> {
  TextEditingController nameContr = TextEditingController();

  TextEditingController brandContr = TextEditingController();

  TextEditingController priceContr = TextEditingController();
  var boxGm = Hive.box("gm");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Second Example"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: TextField(
                    controller: nameContr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: TextField(
                    controller: brandContr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Brand"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: TextField(
                    controller: priceContr,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Price")),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      boxGm.add(CarsModel(
                          brand: brandContr.text,
                          name: nameContr.text,
                          price: int.parse(priceContr.text)));
                      brandContr.clear();
                      nameContr.clear();
                      priceContr.clear();

                      setState(() {});
                    },
                    child: const Text("Save")),
                ElevatedButton(
                    onPressed: () {
                      boxGm.clear();
                      print("------------------Box Gm delete boldi");
                      print("__________________${boxGm.values}");
                      setState(() {});
                    },
                    child: const Text("Delete all")),
                const SizedBox(height: 20),
                boxGm.values.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: boxGm.values.length,
                            itemBuilder: (context, index) {
                              List<CarsModel> cars =
                                  boxGm.values.toList().cast();
                              return ListTile(
                                title: Text(cars[index].name),
                                subtitle: Text(cars[index].brand),
                                trailing:
                                    Text("${cars[index].price.toString()} USD"),
                              );
                            }),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
