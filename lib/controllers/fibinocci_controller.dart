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

 late var fibonacciValue = BigInt.zero.obs;
  late Rx<BigInt> bigdata; 
  RxList<BigInt>bigData=<BigInt>[].obs;
  late var aa ="".obs;
 fib( BigInt x, BigInt y, c, {d}) {
  if (c <= num.parse(d)) {
    BigInt z = x + y;
    c++;
   fib(y, z, c, d: d);
   print("y ${y}");
   bigData.value.add(y);
   aa.value = bigData.first.toString();
  fibonacciValue.value= y;
   print("my a ${bigData.first}");
  }
  
 update();}


}
