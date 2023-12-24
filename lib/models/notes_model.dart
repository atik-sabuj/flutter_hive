
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NotesModel {

  String title;

  String description;

  NotesModel({required this.title, required this.description});
  
}