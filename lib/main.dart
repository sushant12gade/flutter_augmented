import 'package:flutter_ar_app/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async
{
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    
  }
  catch (errorMsg) 
  {
    print("Error::" +errorMsg.toString());
  }
  


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}

 
   

