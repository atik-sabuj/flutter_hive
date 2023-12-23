import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Hive Database'),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          
          var box = await Hive.openBox('Sabuj Atik');

          box.put('name', 'Sabuj Atik');
          box.put('age', '27');

          print(box.get('name'));
          print(box.get('age'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
