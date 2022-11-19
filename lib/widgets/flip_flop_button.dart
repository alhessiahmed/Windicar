import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class FlipFlopButton extends StatelessWidget {
  FlipFlopButton({
    required this.firstButtonTitle,
    required this.secondButtonTitle,
    required this.firstButtonAction,
    required this.secondButtonAction,
    this.firstButtonIsSelected = false,
    Key? key,
  }) : super(key: key);

  final String firstButtonTitle;
  final String secondButtonTitle;
  final Function() firstButtonAction;
  final Function() secondButtonAction;
  bool firstButtonIsSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: firstButtonIsSelected
                  ? AppColors.darkGreen
                  : AppColors.darkGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                    24.r,
                  ),
                  bottomStart: Radius.circular(
                    24.r,
                  ),
                ),
              ),
            ),
            onPressed: firstButtonAction,
            child: Text(
              firstButtonTitle,
              style: AppTextStyles.textStyle16,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: !firstButtonIsSelected
                  ? AppColors.darkGreen
                  : AppColors.darkGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(
                    24.r,
                  ),
                  bottomEnd: Radius.circular(
                    24.r,
                  ),
                ),
              ),
            ),
            onPressed: secondButtonAction,
            child: Text(
              secondButtonTitle,
              style: AppTextStyles.textStyle16,
            ),
          ),
        ),
      ],
    );
  }
}
