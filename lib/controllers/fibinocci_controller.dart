import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:get/get_rx/get_rx.dart';

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
  findMyFibinocci(BigInt x, BigInt y, c, {d}) {
    bigData.value.clear();
    fibinocci(x, y, c, d: d);
    print(bigData.length);
  }

  fibinocci(BigInt x, BigInt y, c, {d}) {
    if (c <= num.parse(d)) {
      BigInt z = x + y;
      c++;
      fibinocci(y, z, c, d: d);
      print("y ${y}");
      bigData.value.add(y);
    }
    if (bigData.value.isNotEmpty) {
      fibinocciValue.value = bigData.value.first.toString();
    }
    update();
  }
}
