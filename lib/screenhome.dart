import 'package:flutter/material.dart';

import 'liststudent.dart';

import 'model/textfield.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   getAddAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            
         const   Expanded(
          child:ListStudentWidget(), ),

        
          ],
        ),
      ),
    );
  }
}

