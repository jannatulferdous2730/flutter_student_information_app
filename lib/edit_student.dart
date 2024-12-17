import 'package:flutter/material.dart';
import 'package:flutter_student_information_app/list_students.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'database/db_helper.dart';
import 'model/info.dart';

class EditStudent extends StatefulWidget {

  final notes;
  const EditStudent({super.key, required this.notes});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {


  late DatabaseHelper dbHelper;

  var nameController=TextEditingController();
  var matric_idController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  int? id;



  //add notes to database
  Future  updateNotes(int id) async
  {
    final updatedNote = Note(
      name: nameController.text,
      matric_id: matric_idController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    int check= await dbHelper.updateData(updatedNote.toMap(),id);
    print("Check=$check");
    if(check>0)
    {

      Get.snackbar("Updated", "Note Updated",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(ListStudents());

    }
    else
    {
      Get.snackbar("Error", "Error in note update",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DatabaseHelper.instance;
    nameController.text=widget.notes.name;
    matric_idController.text=widget.notes.matric_id;
    id=widget.notes.id;


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student"),
      ),

      body: Form(
        key: noteFormKey,

        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(

                    controller: nameController,



                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200 ,width: 2)
                      ),


                      border: OutlineInputBorder(),
                      labelText: "Name",
                      fillColor: Colors.blue.shade900,


                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200)
                      ),


                      hintText: "Student Name",
                      prefixIcon: Icon(Icons.people_outline_sharp, color: Colors.blueAccent.shade700,),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(

                    controller: matric_idController,



                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200 ,width: 2)
                      ),


                      border: OutlineInputBorder(),
                      labelText: "ID",
                      fillColor: Colors.blue.shade900,


                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200)
                      ),


                      hintText: "Student ID",
                      prefixIcon: Icon(Icons.badge_outlined, color: Colors.blueAccent.shade700,),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(

                    controller: phoneController,



                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200 ,width: 2)
                      ),


                      border: OutlineInputBorder(),
                      labelText: "Phone",
                      fillColor: Colors.blue.shade900,


                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200)
                      ),


                      hintText: "Phone",
                      prefixIcon: Icon(Icons.phone_in_talk_outlined, color: Colors.blueAccent.shade700,),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(

                    controller: emailController,



                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200 ,width: 2)
                      ),


                      border: OutlineInputBorder(),
                      labelText: "Email",
                      fillColor: Colors.blue.shade900,


                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200)
                      ),


                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent.shade700,),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(

                    controller: locationController,



                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200 ,width: 2)
                      ),


                      border: OutlineInputBorder(),
                      labelText: "Location",
                      fillColor: Colors.blue.shade900,


                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blueAccent.shade200)
                      ),


                      hintText: "Location",
                      prefixIcon: Icon(Icons.location_on_outlined, color: Colors.blueAccent.shade700,),
                    ),
                  ),
                ),

                ElevatedButton(onPressed: ()  async {


                  if(noteFormKey.currentState!.validate())
                  {
                    noteFormKey.currentState!.save();



                    updateNotes(id!);



                  }






                },
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.blueAccent.shade400,
                      minimumSize: Size( 150, 50), //width and height



                    ),
                    child: Text("Update",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    )
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
