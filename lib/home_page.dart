import 'package:flutter/material.dart';
import 'package:flutter_hive/boxes/boxes.dart';
import 'package:flutter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

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
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20,),

                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel')),

            TextButton(onPressed: (){
              final data = NotesModel(
                  title: titleController.text,
                  description: descriptionController.text);

              final box = Boxes.getData();
              box.add(data);

              data.save();

              print(box);

              titleController.clear();
              descriptionController.clear();

              Navigator.pop(context);
            }, child: Text('Add')),
          ],
        );
      }
  );
    }
}




