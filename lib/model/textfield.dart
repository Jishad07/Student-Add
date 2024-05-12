// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model.dart';

class AddStudentWidget extends StatelessWidget {
   AddStudentWidget({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller:nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "student Name",
            ),
          ),
         const  SizedBox(height: 25,),
           TextFormField(
            controller:ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "student age",
            ),
          ),
         const  SizedBox(height: 25,),
         ElevatedButton.icon(onPressed: (){
             onAddStudent();
         }, icon: const Icon(Icons.add), label: const Text("Add Student") )
        ],
      ),);
      
      
    
  }
  



  

  Future <void >onAddStudent() async {
    final name = nameController.text;
    final age = ageController.text;
    if (name.isEmpty || age.isEmpty) {
      return;
    } else{
     
       final value=StudentModel(name: name, age: age);
       addStudent(value);
       nameController.clear();
       ageController.clear();
    }
  }
    // Add the student to the list or perform any other desired actions.
  }
  
  
 ValueNotifier <List<StudentModel>> studentListnotifier = ValueNotifier([]);

    // ignore: duplicate_ignore
    Future <void> addStudent(StudentModel value)async{ 

     final studentDb=await Hive.openBox<StudentModel>("textfield");
      final id1=await studentDb.add(value);
       value.id=id1;
       studentDb.put(id1, value);
       getAddAllStudents();
}

     Future <void >getAddAllStudents()async{
      final studentDb=await Hive.openBox<StudentModel>("textfield");
      studentListnotifier.value.clear();

    for(var i in studentDb.values){
    print("refreshed id= ${i.id}");
    }
      
       studentListnotifier.value.addAll(studentDb.values);
       studentListnotifier.notifyListeners();
    }


    Future<void>deletestudent(int id)async{
     final studentDb= await Hive.openBox<StudentModel>("textfield");
      await studentDb.delete(id);
           getAddAllStudents();
       
         
    }



















 