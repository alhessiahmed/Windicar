import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/model/car.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import 'package:logo/widgets/flip_flop_button.dart';

class AddOrUpdateCar extends StatefulWidget {
  AddOrUpdateCar({
    this.car,
    Key? key,
  }) : super(key: key);
  Car? car;

  @override
  State<AddOrUpdateCar> createState() => _AddOrUpdateCarState();
}

class _AddOrUpdateCarState extends State<AddOrUpdateCar> {
  TextEditingController cityController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  bool fuelFirstButtonIsSelected = false;
  bool carFirstButtonIsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
        title: 'Déposez votre annonces',
        context: context,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: cityController,
                hintText: 'Entrez le nom de la ville',
                suffixIcon: SvgPicture.asset(
                  'assets/images/ic_edit.svg',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: cityController,
                hintText: 'Nom de voiture',
                suffixIcon: SvgPicture.asset(
                  'assets/images/ic_edit.svg',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: cityController,
                hintText: 'Prix/jour',
                suffixIcon: SvgPicture.asset(
                  'assets/images/ic_edit.svg',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: cityController,
                hintText: 'Description',
                maxLines: 6,
                suffixIcon: SvgPicture.asset(
                  'assets/images/ic_edit.svg',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 16.h),
              FlipFlopButton(
                firstButtonTitle: 'Essence',
                secondButtonTitle: 'Gasoil',
                firstButtonIsSelected: fuelFirstButtonIsSelected,
                firstButtonAction: () {
                  setState(() {
                    fuelFirstButtonIsSelected = true;
                  });
                },
                secondButtonAction: () {
                  setState(() {
                    fuelFirstButtonIsSelected = false;
                  });
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              FlipFlopButton(
                firstButtonTitle: 'Manuel',
                secondButtonTitle: 'Automatique',
                firstButtonIsSelected: carFirstButtonIsSelected,
                firstButtonAction: () {
                  setState(() {
                    carFirstButtonIsSelected = true;
                  });
                },
                secondButtonAction: () {
                  setState(() {
                    carFirstButtonIsSelected = false;
                  });
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Ajouter des photos',
                style: AppTextStyles.textStyle16,
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 97,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 54.w / 54.h,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      color: AppColors.white,
                      size: 40.r,
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
