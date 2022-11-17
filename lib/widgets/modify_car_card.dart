import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class ModifyCarCard extends StatelessWidget {
  const ModifyCarCard({
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final String subtitle;
  final int id;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.darkGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Image.asset(
                  imgUrl,
                  width: 166.w,
                  height: 141.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(start: 8.w),
                width: 166.w,
                height: 141.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            heightFactor: 0.6,
            child: TextButton.icon(
              onPressed: onTap,
              icon: SvgPicture.asset('assets/images/ic_edit.svg'),
              label: Text(
                'Modifier',
                style: AppTextStyles.whiteTextStyle14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
