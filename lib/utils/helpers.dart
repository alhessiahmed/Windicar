import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logo/getx/profile_getx_controller.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

mixin Helpers {
  void showSnackBar(
    BuildContext context, {
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  void pickImageSource(
      {required BuildContext context,
      required ProfileGetxController controller}) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pick Image Source',
                  style: AppTextStyles.textStyle17,
                ),
                Divider(
                  color: AppColors.darkGreen,
                  indent: 24.w,
                  endIndent: 24.w,
                  thickness: 3,
                  height: 32.h,
                ),
                // const Text('content'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        print('*********** CLICKED ON CAMERA ***********');
                        await controller.pickImageFrom(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      // style: IconButton.styleFrom(
                      //   fixedSize: Size(Get.width / 2, 100.h),
                      // ),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.darkGreen,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        print('*********** CLICKED ON GALLERY ***********');
                        await controller.pickImageFrom(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      // style: IconButton.styleFrom(
                      //   fixedSize: Size(Get.width / 2, 100.h),
                      // ),
                      icon: const Icon(
                        Icons.photo_outlined,
                        color: AppColors.darkGreen,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
