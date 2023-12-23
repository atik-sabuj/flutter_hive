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
          FutureBuilder(
            future: Hive.openBox('Sabuj Atik'),
              builder: (context, snapshot){
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                    ),

                    // Text(snapshot.data!.get('name').toString()),
                    // Text(snapshot.data!.get('age').toString()),
                    // Text(snapshot.data!.get('details').toString()),

                  ],
                );
              }),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          
          var box = await Hive.openBox('Sabuj Atik');

          box.put('name', 'Sabuj Atik');
          box.put('age', '27');

          box.put('details', {
            'pro' : 'developer',
            'salary' : '30k'
          });

          print(box.get('name'));
          print(box.get('age'));
          print(box.get('details'));
          //print(box.get('details')['pro']);

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
