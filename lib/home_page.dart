import 'package:flutter/material.dart';
import 'package:flutter_hive/boxes/boxes.dart';
import 'package:flutter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _){
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            itemCount: box.length,
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container(
                  height: 100,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10 ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(data[index].title.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  delete(data[index]);
                                },
                                  child: Icon(Icons.delete, color: Colors.red,)),
                              SizedBox(width: 15,),
                              Icon(Icons.edit),

                            ],
                          ),
                          Text(data[index].description.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _showMyDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void delete(NotesModel notesModel) async{
    await notesModel.delete();
  }

  Future<void> _editMyDialog()async {

    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Edit Notes'),
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




