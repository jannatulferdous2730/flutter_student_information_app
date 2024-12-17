import 'package:flutter/material.dart';

import 'add_student.dart';
import 'list_students.dart';
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
        title: Text("Student info"),
      ),



      body: Column(
        children: [
          Image.asset("assets/images/student_info.png"),


          ElevatedButton.icon(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent(),));


          },
            icon: Icon(Icons.person, color: Color(0xFF4F956F), size: 30,),
            label: Text("ADD STUDENTS", style: TextStyle(
              color: Color(0xFF4F956F),
              fontWeight: FontWeight.w900,
              fontSize: 27,
            ),),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 100), // Width: 200, Height: 50
              shadowColor: Color(0xFF283A2E),
            ),

          ),


          ElevatedButton.icon(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => ListStudents(),));


          },
            icon: Icon(Icons.person, color: Color(0xFF4F956F), size: 30,),
            label: Text("List Student Record", style: TextStyle(
              color: Color(0xFF4F956F),
              fontWeight: FontWeight.w900,
              fontSize: 27,
            ),),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 100), // Width: 200, Height: 50
              shadowColor: Color(0xFF283A2E),
            ),

          ),
        ],
      ),

    );
  }
}


