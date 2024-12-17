import 'package:flutter/material.dart';
import 'package:flutter_student_information_app/edit_student.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'database/db_helper.dart';
import 'model/info.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({super.key});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {


  //declared variables
  late DatabaseHelper dbHelper;
  List<Note> notes = [];


  @override
  void initState() {
    super.initState();
    //initializing dbHelper
    dbHelper = DatabaseHelper.instance;

    //load notes on startup
    loadAllNotes();
  }


  //for loading data from db
  Future loadAllNotes() async {
    final data = await dbHelper.getAllData(); //daroyan
    setState(() {

      //This line converts a list of map entries (database records) into a list of Note objects using the Note.fromMap method, making it easier to work with custom objects in your app.
      //each element is a map, represented by e
      notes = data.map((e) => Note.fromMap(e)).toList();


    });
  }



  //for deleting a note
  Future deleteNote(int id) async {
    int check= await dbHelper.deleteData(id);
    if(check>0){
      Fluttertoast.showToast(msg: "Note deleted successfully");
      loadAllNotes();
    }
    else
    {
      Fluttertoast.showToast(msg: "Failed to delete note");
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("buguusugguu", style: TextStyle(
          color: Colors.white
        ),),
      ),


      body: notes.isEmpty
        ? const Center(child: Text("No information available!"),)


         : ListView.builder(
        itemBuilder: (context, index) {
          Note note = notes[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.blue, width: 1),// here width means thickness
                borderRadius: BorderRadius.circular(5),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditStudent(notes: note)));
              },  // for clickable list item
              title: Text(note.name!,style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Text(note.matric_id!),
              leading: const Icon(
                Icons.note_alt_outlined,
                size: 40,

              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete,color: Colors.redAccent,size: 40,),
                onPressed: () {


                  deleteNote(note.id!);
                  Get.back();


                } ,
              ),
            ),
          );
        },
      ),
    );
  }
}
