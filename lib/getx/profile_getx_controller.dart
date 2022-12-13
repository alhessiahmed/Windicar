import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileGetxController extends GetxController {
  ProfileGetxController({
    required this.emailContent,
    required this.nameContent,
    required this.mobileContent,
  });
  final String emailContent;
  final String nameContent;
  final String mobileContent;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController mobileController;
  final formKey = GlobalKey<FormState>();
  XFile? pickedImage;
  bool imageIsUpdated = false;
  late ImagePicker imagePicker = ImagePicker();

  @override
  onInit() {
    nameController = TextEditingController(text: nameContent);
    emailController = TextEditingController(text: emailContent);
    mobileController = TextEditingController(text: mobileContent);
    super.onInit();
  }

  Future<void> pickImageFrom(ImageSource imageSource) async {
    XFile? img = await imagePicker.pickImage(
      source: imageSource,
      imageQuality: 70,
    );
    if (img != null) {
      pickedImage = img;
      imageIsUpdated = true;
      update();
    }
  }
}
