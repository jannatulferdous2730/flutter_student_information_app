import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'database/db_helper.dart';
import 'list_students.dart';
import 'model/info.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  late DatabaseHelper dbHelper;

  var nameController=TextEditingController();
  var matric_idController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();

  final GlobalKey<FormState> noteFormKey = GlobalKey();

  //add notes to database
  Future addNotes() async
  {
    final newNote = Note(
      name: nameController.text,
      matric_id: matric_idController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    //if data insert successfully, its return row number which is greater that 1 always
    int check= await dbHelper.insertData(newNote.toMap());
    print("Check=$check");
    if(check>0)
    {


      Get.snackbar("Success", "Note Added",snackPosition: SnackPosition.BOTTOM);
      Get.offAll(ListStudents());
    }
    else
    {
      Get.snackbar("Error", "Error in adding notes",snackPosition: SnackPosition.BOTTOM);
    }


  }


  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;

  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),

      body: Form(
        key: noteFormKey,
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

                  // validator: (String? value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter note title";
                  //   }
                  //
                  //   return null;
                  // },



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
        
              ElevatedButton(onPressed: () async {

                if(noteFormKey.currentState!.validate())
                {
                  noteFormKey.currentState!.save();



                  addNotes();



                }

              },
                  style: ElevatedButton.styleFrom(
        
                    backgroundColor: Colors.blueAccent.shade400,
                    minimumSize: Size( 150, 50), //width and height
        
        
        
                  ),
                  child: Text("Save",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  )
              ),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
