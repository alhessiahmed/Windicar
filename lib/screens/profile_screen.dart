import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/user_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';
import 'package:logo/screens/add_or_update_car.dart';
import 'package:logo/screens/update_profile_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_floating_button.dart';
import 'package:logo/widgets/modify_car_card.dart';

class ProfileScreen extends StatelessWidget with Helpers {
  const ProfileScreen({
    required this.userId,
    Key? key,
  }) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserGetxController>(
      init: UserGetxController(userId: userId),
      builder: (UserGetxController controller) {
        if (controller.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.darkGreen,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => await controller.readUser(),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    snap: false,
                    pinned: true,
                    floating: false,
                    title: Text(
                      controller.user?.name ?? 'User Name',
                      style: AppTextStyles.whiteTextStyle17.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF35CEA9),
                              Color(0xFF14AEA1),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 96.h,
                            ),
                            CircleAvatar(
                              radius: 33.r,
                              backgroundColor: AppColors.white,
                              backgroundImage: controller.user?.imageUrl != null
                                  ? NetworkImage(controller.user!.imageUrl!)
                                  : const AssetImage('assets/images/avatar.jpg')
                                      as ImageProvider,
                            ),
                            SizedBox(
                              height: 22.h,
                              width: Get.width.w,
                            ),
                            Text(
                              controller.user?.city?.name ?? 'City',
                              style: AppTextStyles.textStyle14.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     const Icon(
                            //       Icons.star,
                            //       color: AppColors.yollowStar,
                            //     ),
                            //     SizedBox(
                            //       width: 4.w,
                            //     ),
                            //     Text(
                            //       controller.user?.rate ?? '0',
                            //       style: AppTextStyles.textStyle14.copyWith(
                            //         color: AppColors.white,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 13.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'membre depuis',
                                  style: AppTextStyles.textStyle14.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  controller.user?.createdAt.substring(0, 10) ??
                                      DateFormat.yMd().format(DateTime.now()),
                                  style: AppTextStyles.textStyle14.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    expandedHeight: 284.h,
                    backgroundColor: const Color(0xFF35CEA9),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                      ),
                      tooltip: 'Back Button',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.white,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'modify',
                            child: Text(
                              "Modifier",
                              style: AppTextStyles.textStyle16,
                            ),
                          ),
                          PopupMenuItem(
                            value: 'logout',
                            child: Text(
                              "se déconnecter",
                              style: AppTextStyles.textStyle16,
                            ),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'modify') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen(
                                  userId: userId,
                                  imgUrl: controller.user?.imageUrl,
                                  name: controller.user!.name,
                                  email: controller.user!.email,
                                  mobile: controller.user!.phone,
                                ),
                              ),
                            );
                          } else if (value == 'logout') {
                            _performLogout(context);
                          }
                        },
                      ),
                    ],
                  ),
                  // SliverToBoxAdapter(), // Learn this later on
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 16.w, top: 16.h),
                          child: Text(
                            // '${controller.user?.callCount ?? '0'} Annonces',
                            '${controller.user?.cars.length ?? '0'} Annonces',
                            style: AppTextStyles.textStyle16,
                            // textAlign: TextAlign.start,
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.grey,
                          endIndent: 202.w,
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsetsDirectional.only(
                      start: 16.w,
                      end: 16.w,
                    ),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          Car car = controller.user!.cars[index];
                          // print(car.images[index]);
                          return ModifyCarCard(
                            id: car.id,
                            imgUrl: car.images.isNotEmpty
                                ? car.images.first.imageUrl
                                : null,
                            title: car.carName,
                            subtitle: car.price,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddOrUpdateCar(
                                    carId: car.id,
                                    oldCityId: car.cityId,
                                    oldDescription: car.description,
                                    oldName: car.carName,
                                    oldPrice: car.price,
                                    wasEssence: car.fueltype == 'Essence',
                                    wasManuel: car.cartype == 'Manuel',
                                  ),
                                ),
                              ).then((value) => controller.readUser());
                            },
                            onDelete: () {
                              _confirmDelete(
                                context: context,
                                controller: controller,
                                id: car.id,
                              );
                            },
                          );
                        },
                        childCount: controller.user?.cars.length ?? 0,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 166.w / 188.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: const CustomFloatingButton(isHome: false),
          );
        }
      },
    );
  }

  Future<void> _confirmDelete({
    required BuildContext context,
    required UserGetxController controller,
    required int id,
  }) async {
    bool? result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          if (Platform.isAndroid) {
            return AlertDialog(
              title: const Text(
                'Êtes-vous sûr?',
              ),
              content: const Text(
                'Supprimer la voiture',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Supprimer',
                    style: TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Annuler'),
                ),
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: const Text(
                'Êtes-vous sûr?',
              ),
              content: const Text(
                'Supprimer la voiture',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Supprimer'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Annuler'),
                ),
              ],
            );
          }
        });
    if (result ?? false) {
      ApiResponse response = await controller.deleteCar(id: id);

      if (response.success) {
        controller.readUser();
      }
      showSnackBar(
        context,
        message: response.message,
        error: !response.success,
      );
    }
  }

  void _performLogout(BuildContext context) async {
    ApiResponse response = await AuthApiController().logout();
    showSnackBar(
      context,
      message: response.message,
      error: !response.success,
    );
    Navigator.pushNamed(context, '/home_screen');
  }
}
