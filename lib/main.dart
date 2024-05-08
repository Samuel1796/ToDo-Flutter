import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tuts/pages/home_page.dart';

Future<void> main() async {
  //initialize the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
