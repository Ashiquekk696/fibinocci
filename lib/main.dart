import 'package:fibinocci_app/views/fibinocci_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'fIBINOCCI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FibanocciView(),
    );
  }
}