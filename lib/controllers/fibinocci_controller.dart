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
  late var isLoading = false.obs;
  Future<void> findMyFibinocci(BigInt x, BigInt y, c, {d}) async {
    isLoading.value = true;
    bigData.value.clear();
    await fibinocci(x, y, c, d: d);

    print(bigData.length);

    isLoading.value = false;
  }

  Future<void> fibinocci(BigInt x, BigInt y, c, {d}) async {
    if (c <= num.parse(d)) {
      BigInt z = x + y;
      c++;
      await fibinocci(y, z, c, d: d);
      
      bigData.value.add(y);
      print("y ${y}");
    }
    if (bigData.value.isNotEmpty) {
      fibinocciValue.value = bigData.value.first.toString();
    }
    update();
  }
}
