import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/test_home_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/screens/update_profile_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_floating_button.dart';
import 'package:logo/widgets/modify_car_card.dart';

class ProfileScreen extends StatelessWidget with Helpers {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            title: Text(
              'Mark stephane',
              style: AppTextStyles.whiteTextStyle17,
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
                      backgroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                      width: Get.width.w,
                    ),
                    Text(
                      'Casablanca',
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yollowStar,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          '4.5',
                          style: AppTextStyles.textStyle14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
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
                        builder: (context) => const UpdateProfileScreen(),
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
                  padding: EdgeInsetsDirectional.only(start: 16.w, top: 16.h),
                  child: Text(
                    '186 Annonces',
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
          GetBuilder(
            init: TestHomeGetxController(),
            builder: (TestHomeGetxController controller) {
              if (controller.loading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SliverPadding(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    end: 16.w,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ModifyCarCard(
                          id: controller.items[index].id,
                          imgUrl: controller.items[index].imgUrls.first,
                          title: controller.items[index].title,
                          subtitle: controller.items[index].subtitle,
                          onTap: (() async =>
                              await controller.toggleFavorite(index: index)),
                        );
                      },
                      childCount: controller.items.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 166.w / 188.h,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
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
