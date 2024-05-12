 import 'package:flutter/material.dart';

import 'model/textfield.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return ValueListenableBuilder(
      valueListenable: studentListnotifier,
      builder: ( ctx,  StudentList, child){
        return  ListView.separated(
        itemBuilder: (ctx, index) {
         final data = StudentList[index];
          return Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(data.name,),
              subtitle: Text(data.age),
              trailing:IconButton(onPressed: (){
               if(data.id!=null){
                  deletestudent(data.id!);
            
               }
               else{
                  
               }
              }, icon:const Icon(Icons.delete),color: Colors.red,),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: StudentList.length,
      );
      },
       
    );
  }
}