import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final String phone;
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
                  callTelephone(context: context, number: phone);
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
                openWhatsapp(context: context, number: '+$phone');
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

  void callTelephone({
    required BuildContext context,
    required String number,
  }) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Can't make phone calls")));
    }
  }

  void openWhatsapp(
      {required BuildContext context,
      // required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    //     "whatsapp://send?phone=" + whatsapp + "&text=$text";
    // var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    var whatsappURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
}
