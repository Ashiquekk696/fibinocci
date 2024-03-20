import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/fibinocci_controller.dart';

class FibanocciView extends StatelessWidget {
  FibanocciView({super.key});
  @override
  Widget build(BuildContext context) {
    FibinocciController fibonacciController = Get.put(FibinocciController());
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibinocci App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the position',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type the number here',
              ),
            ),
            SizedBox(height: 20),
            Text(fibonacciController.aa.value),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    fibonacciController.fib(
                        BigInt.parse("0"), BigInt.parse("1"), 1,
                        d: textEditingController.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
            Text("Fibinocci Valuee ${textEditingController.text}"),
            Obx(() => Text(fibonacciController.aa!=null
                ? fibonacciController.aa.value.toString()
                : "g"))
          ],
        ),
      ),
    );
  }
}
