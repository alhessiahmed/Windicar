import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class ModifyCarCard extends StatelessWidget {
  ModifyCarCard({
    this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.onTap,
    required this.onDelete,
    Key? key,
  }) : super(key: key);
  String? imgUrl;
  final String title;
  final String subtitle;
  final int id;
  final Function() onTap;
  final void Function()? onDelete;

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
                child: Image.network(
                  imgUrl ??
                      'https://th.bing.com/th/id/OIP.M7kw1oNiYcA4AYoVb_fx7gHaFj?pid=ImgDet&rs=1',
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
              PositionedDirectional(
                top: 6,
                end: 6,
                child: InkWell(
                  onTap: onDelete,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 16,
                    child: Icon(
                      Icons.delete_forever_rounded,
                      color: AppColors.red,
                      size: 24,
                    ),
                  ),
                ),
              )
              // PositionedDirectional(
              //   top: 8.r,
              //   end: 8.r,
              //   child: InkWell(
              //     onTap: () {},
              //     child: Container(
              //       padding: EdgeInsets.all(2.r),
              //       decoration: BoxDecoration(
              //         color: AppColors.white,
              //         borderRadius: BorderRadius.circular(8.r),
              //       ),
              //       child: Icon(
              //         Icons.delete_forever_rounded,
              //         color: AppColors.red,
              //         size: 28.r,
              //       ),
              //     ),
              //   ),
              // ),
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
