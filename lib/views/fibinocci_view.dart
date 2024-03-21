import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controllers/fibinocci_controller.dart';

class FibanocciView extends StatelessWidget {
  FibanocciView({super.key});
      FibinocciController fibonacciController = Get.put(FibinocciController());

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonocci App'),
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
              controller: fibonacciController.textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type the number here',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ()async {
                  await  fibonacciController.findMyFibinocci(
                        BigInt.parse("0"), BigInt.parse("1"), 1,
                        d: fibonacciController.textEditingController.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ), 
            Obx(() {
              return  
              Text(
                  "Fibanocci Value : ${fibonacciController.fibinocciValue != null ?
                   fibonacciController.fibinocciValue.value.toString() : "0"}");
            })
          ],
        ),
      ),
    );
  }
}
