// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailsGetxController extends GetxController {
  // final PageController pageController = PageController();
  int imgIndex = 0;

  void updateImgIndex({required index}) {
    imgIndex = index;
    update();
  }
}
