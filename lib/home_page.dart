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
            future: Hive.openBox('Sabuj'),
              builder: (context, snapshot){
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('name').toString()),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                      trailing: IconButton(
                        onPressed: (){
                          snapshot.data!.put('name', 'Sabuj Atik Tech');
                          snapshot.data!.put('age', '27');

                          //snapshot.data!.delete('name');    // For Data Delete


                          setState(() {

                          });
                        },
                        icon: Icon(Icons.edit),

                        //icon: Icon(Icons.delete),     // For Data Delete

                      ),
                    ),

                    // Text(snapshot.data!.get('name').toString()),
                    // Text(snapshot.data!.get('age').toString()),
                    // Text(snapshot.data!.get('details').toString()),

                  ],
                );
              }),

          FutureBuilder(
              future: Hive.openBox('Site'),
              builder: (context, snapshot){
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.get('linkedIn').toString()),
                    ),
                  ],
                );
              }),
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
