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
          _showMyDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }


Future<void> _showMyDialog()async {

  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Add Notes'),
          content: SingleChildScrollView(
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Add')),

            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Add')),
          ],
        );
      }
  );
    }
}






// floatingActionButton: FloatingActionButton(
// onPressed: () async{
//
// var box = await Hive.openBox('Sabuj');
// var box2 = await Hive.openBox('Site');
//
// box2.put('linkedIn', 'atik-sabuj');
//
// box.put('name', 'Sabuj');
// box.put('age', '25');
//
// box.put('details', {
// 'pro' : 'developer',
// 'post' : 'engineer'
// });
//
// print(box.get('name'));
// print(box.get('age'));
// print(box.get('details'));
// //print(box.get('details')['pro']);
//
// },
// child: Icon(Icons.add),
// ),
