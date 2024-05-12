import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_1/model/model.dart';

import 'screenhome.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
  {
     Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MaterialApp(
    home: ScreenHome(),
  ));
}








 


 


















 //  WidgetsFlutterBinding.ensureInitialized();
//  await Hive.initFlutter();
//   if(!Hive.isAdapterRegistered( StudentModelAdapter().typeId)){
//      Hive.registerAdapter(StudentModelAdapter());
//   }