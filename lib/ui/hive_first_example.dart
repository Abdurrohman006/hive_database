import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/ui/hive_second_example.dart';

// ignore: must_be_immutable
class HiveFirstExample extends StatefulWidget {
  HiveFirstExample({Key? key}) : super(key: key);

  @override
  State<HiveFirstExample> createState() => _HiveFirstExampleState();
}

class _HiveFirstExampleState extends State<HiveFirstExample> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var boxVegetables = Hive.box("vegetables");
    // boxVegetables.put("ism", "David");
    // var ism = boxVegetables.get("ism");
    // print("Namelari: $ism");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive first Example"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HiveSecondExample(),
                  ));
            },
            icon: Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print(boxVegetables.add(controller.text));
                      // print(boxVegetables.get("key1"));
                      setState(() {});
                    },
                    icon: const Icon(Icons.add)),
                SizedBox(height: 100),
                // Text("Db ichidagi ma'lumot: ${boxVegetables.get("key1")}"),

                //
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: boxVegetables.values.length,
                  itemBuilder: (context, index) =>
                      Text(boxVegetables.values.elementAt(index).toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
