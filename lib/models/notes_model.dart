

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NotesModel {

  String title;

  String description;

  NotesModel({required this.title, required this.description});
  
}


@HiveType(typeId: 1)
class ContactModel {

  String title;

  String description;

  ContactModel({required this.title, required this.description});

}
