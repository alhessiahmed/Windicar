import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * (2 / 3),
      width: Get.width,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}