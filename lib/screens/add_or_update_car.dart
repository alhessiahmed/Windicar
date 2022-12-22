import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/getx/add_or_update_car_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car_image.dart';
import 'package:logo/model/city.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import 'package:logo/widgets/flip_flop_button.dart';

class AddOrUpdateCar extends StatelessWidget with Helpers {
  AddOrUpdateCar({
    this.carId,
    this.oldCityId,
    this.oldDescription,
    this.oldName,
    this.oldPrice,
    this.wasEssence,
    this.wasManuel,
    this.images,
    Key? key,
  }) : super(key: key);
  int? carId;
  String? oldName;
  String? oldPrice;
  String? oldDescription;
  bool? wasEssence;
  bool? wasManuel;
  int? oldCityId;
  List<CarImage>? images;

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
          child: GetBuilder<AddOrUpdateCarGetxController>(
              init: AddOrUpdateCarGetxController(
                oldCityId: oldCityId,
                oldDescription: oldDescription,
                oldName: oldName,
                oldPrice: oldPrice,
                wasEssence: wasEssence,
                wasManuel: wasManuel,
              ),
              builder: (AddOrUpdateCarGetxController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomTextFormField(
                      //   controller: controller.cityController,
                      //   hintText: 'Entrez le nom de la ville',
                      //   suffixIcon: SvgPicture.asset(
                      //     'assets/images/ic_edit.svg',
                      //     height: 21.h,
                      //     width: 21.w,
                      //     color: AppColors.grey,
                      //   ),
                      // ),
                      Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.sugarWhite,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.17),
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButton<int>(
                          underline: Container(),
                          isExpanded: true,
                          onChanged: (int? value) {
                            if (value != null) {
                              controller.selectCountry(value);
                            }
                          },
                          value: controller.selectedCountryId,
                          hint: Text(
                            'Entrez le nom de la ville',
                            style: AppTextStyles.textStyle14.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          elevation: 3,
                          style: AppTextStyles.textStyle14,
                          items: controller.cities.map(
                            (City city) {
                              return DropdownMenuItem<int>(
                                value: city.id,
                                child: Text(
                                  city.name,
                                  style: AppTextStyles.textStyle14,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),

                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: controller.nameController,
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
                        controller: controller.priceController,
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
                        controller: controller.descriptionController,
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
                        firstButtonIsSelected:
                            controller.fuelFirstButtonIsSelected,
                        firstButtonAction: () {
                          controller.toggleFuelButton(true);
                        },
                        secondButtonAction: () {
                          controller.toggleFuelButton(false);
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      FlipFlopButton(
                        firstButtonTitle: 'Manuel',
                        secondButtonTitle: 'Automatique',
                        firstButtonIsSelected:
                            controller.carFirstButtonIsSelected,
                        firstButtonAction: () {
                          controller.toggleCarStyleButton(true);
                        },
                        secondButtonAction: () {
                          controller.toggleCarStyleButton(false);
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Vous pouvez ajouter 6 photos',
                        style: AppTextStyles.textStyle16,
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickImages();
                        },
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 97,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 8.w,
                            childAspectRatio: 54.w / 54.h,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: controller.images.length > index
                                  ? Image.file(
                                      File(controller.images[index].path),
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.add_rounded,
                                      color: AppColors.white,
                                      size: 40.r,
                                    ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (controller.selectedCountryId != null) {
                            if (isNewCar) {
                              if (controller.images.isNotEmpty) {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  ApiResponse response = await _performAdd(
                                    cityId: controller.selectedCountryId!,
                                    carName: controller.nameController.text,
                                    price: controller.priceController.text,
                                    description:
                                        controller.descriptionController.text,
                                    fuelIsEssence:
                                        controller.fuelFirstButtonIsSelected,
                                    typeIsManuel:
                                        controller.carFirstButtonIsSelected,
                                    images: controller.images,
                                  );
                                  showSnackBar(
                                    context,
                                    message: response.message,
                                    error: !response.success,
                                  );
                                  if (response.success) {
                                    Navigator.pop(context);
                                  }
                                }
                              } else {
                                showSnackBar(
                                  context,
                                  message: 'Please select images',
                                  error: true,
                                );
                              }
                            } else {
                              if (controller.formKey.currentState!.validate()) {
                                ApiResponse response = await _performUpdate(
                                  carId: carId!,
                                  cityId: controller.selectedCountryId!,
                                  carName: controller.nameController.text,
                                  price: controller.priceController.text,
                                  description:
                                      controller.descriptionController.text,
                                  fuelIsEssence:
                                      controller.fuelFirstButtonIsSelected,
                                  typeIsManuel:
                                      controller.carFirstButtonIsSelected,
                                  images: controller.images,
                                );
                                showSnackBar(
                                  context,
                                  message: response.message,
                                  error: !response.success,
                                );
                                if (response.success) {
                                  Navigator.pop(context);
                                }
                              }
                            }
                          } else {
                            showSnackBar(
                              context,
                              message: 'Veuillez sélectionner le pays',
                              error: true,
                            );
                          }
                        },
                        child: Text(
                          'Valider',
                          style: AppTextStyles.whiteTextStyle14,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<ApiResponse> _performUpdate({
    required int carId,
    required int cityId,
    required String carName,
    required String price,
    required String description,
    required bool fuelIsEssence,
    required bool typeIsManuel,
    List<XFile>? images,
  }) async {
    ApiResponse response = await CarApiController().updateCar(
      carId: carId,
      cityId: cityId,
      carName: carName,
      price: price,
      description: description,
      fuelIsEssence: fuelIsEssence,
      typeIsManuel: typeIsManuel,
      images: images,
    );
    return response;
  }

  Future<ApiResponse> _performAdd({
    required int cityId,
    required String carName,
    required String price,
    required String description,
    required bool fuelIsEssence,
    required bool typeIsManuel,
    required List<XFile> images,
  }) async {
    ApiResponse response = await CarApiController().addCar(
      cityId: cityId,
      carName: carName,
      price: price,
      description: description,
      fuelIsEssence: fuelIsEssence,
      typeIsManuel: typeIsManuel,
      images: images,
    );
    return response;
  }

  bool get isNewCar => oldName == null;
}
