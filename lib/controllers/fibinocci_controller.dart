import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:get/get_rx/get_rx.dart';

//1,1,2,3,5,8,13,21,34,55, ....
class FibinocciController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController textEditingController = TextEditingController();

  late Rx<BigInt> bigdata;
  RxList<BigInt> bigData = <BigInt>[].obs;
  late var fibinocciValue = "".obs;
  late var isLoading = false.obs;
  Future<void> findMyFibinocci(BigInt x, BigInt y, c, {d}) async {
    isLoading.value = true;
    if (d == "0") {
      Fluttertoast.showToast(msg: "Sorry !!! 0 can't be an input");
    } else {
      bigData.value.clear();
      bigData.value.insert(0,BigInt.parse("0"));

      await fibinocci(x, y, c, d: d);

      print(bigData.length);

      isLoading.value = false;
    }
    print("bigdata ${bigData.value}");
  }

  Future<void> fibinocci(BigInt x, BigInt y, c, {d}) async {
    if (c < num.parse(d)) {
      BigInt z = x + y;
      c++;

      print("x is $x");
      if(d!="1"){

      bigData.value.add(y);

      await fibinocci(y, z, c, d: d);
      }
      print("y ${y}");
    }
    if (bigData.value.isNotEmpty) {
      fibinocciValue.value = bigData.value.last.toString();
    }
    if (x == 0) {
      print("x is $x");
      bigData.value.add(x);
    }

    update();
  }
}
