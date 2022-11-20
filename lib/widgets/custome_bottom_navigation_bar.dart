import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 82.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: Get.width * 0.4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Color(0xFF35CEA9),
                    Color(0xFF14AEA1),
                  ],
                ),
              ),
              child: ElevatedButton.icon(
                icon: Image.asset('assets/images/ic_phone.png'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, elevation: 0),
                onPressed: () {
                  //TODO : Dial
                },
                label: Text(
                  'Appeler',
                  style: AppTextStyles.textStyle16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.4,
            child: ElevatedButton.icon(
              icon: Image.asset('assets/images/ic_whatsapp.png'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenWhatapp,
              ),
              onPressed: () {
                //TODO : whatapp
              },
              label: Text(
                'Whatsapp',
                style: AppTextStyles.textStyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
