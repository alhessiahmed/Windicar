import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custome_bottom_navigation_bar.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

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
          ),
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
                  endIndent: 51.w,
                ),
              ],
            ),
          ),
          GetBuilder(
            init: HomeGetxController(),
            builder: (HomeGetxController controller) {
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
                        return CarCard(
                          id: controller.items[index].id,
                          imgUrl: controller.items[index].imgUrls.first,
                          title: controller.items[index].title,
                          subtitle: controller.items[index].subtitle,
                          rating: controller.items[index].rating,
                          isFav: controller.items[index].isFav,
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
                      childAspectRatio: 166.w / 220.h,
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
    // return Scaffold(
    //   // extendBodyBehindAppBar: true,
    //   // appBar: AppBars.customeAppBar(
    //   //   context: context,
    //   //   backgroundColor: Colors.transparent,
    //   //   elevation: 0,
    //   //   title: 'Mark stephane',
    //   // ),
    //   body: Stack(
    //     children: [
    //       SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Container(
    //               height: 320.h,
    //               decoration: const BoxDecoration(
    //                 gradient: LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   end: Alignment.bottomCenter,
    //                   colors: [
    //                     AppColors.favoriteOutline,
    //                     AppColors.darkGreen,
    //                   ],
    //                 ),
    //               ),
    //               child: Column(
    //                 children: [
    //                   getAppBarCustom(
    //                     title: 'Mark stephane',
    //                     context: context,
    //                     colorAppBar: AppColors.white,
    //                     // isVisiableMenu: true,
    //                   ),
    //                   // SizedBox(
    //                   //   height: 96.h,
    //                   // ),
    //                   CircleAvatar(
    //                     radius: 33.w,
    //                     backgroundColor: AppColors.white,
    //                     backgroundImage: const NetworkImage(
    //                       'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 22.h,
    //                     width: Get.width.w,
    //                   ),
    //                   Text(
    //                     'Casablanca',
    //                     style: AppTextStyles.blackTextStyle14.copyWith(
    //                       color: AppColors.white,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 8.h,
    //                   ),
    //                   Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       const Icon(
    //                         Icons.star,
    //                         color: AppColors.yollowStar,
    //                       ),
    //                       SizedBox(
    //                         width: 4.w,
    //                       ),
    //                       Text(
    //                         '4.5',
    //                         style: AppTextStyles.blackTextStyle14.copyWith(
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 13.h,
    //                   ),
    //                   Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Text(
    //                         'membre depuis',
    //                         style: AppTextStyles.blackTextStyle14.copyWith(
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 4.w,
    //                       ),
    //                       Text(
    //                         DateFormat.yMd().format(DateTime.now()),
    //                         style: AppTextStyles.blackTextStyle14.copyWith(
    //                           color: AppColors.white,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Align(
    //               alignment: AlignmentDirectional.topStart,
    //               child: Padding(
    //                 padding: EdgeInsetsDirectional.only(start: 16.w),
    //                 child: Text(
    //                   '186 Annonces',
    //                   style: AppTextStyles.blackTextStyle16,
    //                   // textAlign: TextAlign.start,
    //                 ),
    //               ),
    //             ),
    //             Divider(
    //               thickness: 1,
    //               color: AppColors.grey,
    //               endIndent: 51.w,
    //             ),
  //                GetBuilder(
  //                  init: HomeGetxController(),
  //                  builder: (HomeGetxController controller) {
  //                    if (controller.loading) {
  //                      return const Center(
  //                        child: CircularProgressIndicator(),
  //                      );
  //                    } else {
  //                      return GridView.builder(
  //                        shrinkWrap: true,
  //                        // physics: const NeverScrollableScrollPhysics(),
  //                        physics: const BouncingScrollPhysics(),
  //                        padding: EdgeInsets.all(16.r),
  //                        itemCount: controller.items.length,
  //                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                          crossAxisCount: 2,
  //                          mainAxisSpacing: 16.h,
  //                          crossAxisSpacing: 16.w,
  //                          childAspectRatio: 166.w / 220.h,
  //                        ),
  //                        itemBuilder: (context, index) {
  //                          return CarCard(
  //                            id: controller.items[index].id,
  //                            imgUrl: controller.items[index].imgUrls.first,
  //                            title: controller.items[index].title,
  //                            subtitle: controller.items[index].subtitle,
  //                            rating: controller.items[index].rating,
  //                            isFav: controller.items[index].isFav,
  //                            onTap: (() async =>
  //                                await controller.toggleFavorite(index: index)),
  //                          );
  //                        },
  //                      );
  //                    }
  //                  },
  //                )
  //              ],
  //            ),
  //          ),
  //          Positioned(
  //            bottom: 0,
  //            right: 0,
  //            left: 0,
  //            child: Material(
  //              color: AppColors.white,
  //              child: Padding(
  //                padding: EdgeInsets.all(16.w),
  //                child: Row(
  //                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                  children: [
  //                    SizedBox(
  //                      width: Get.width * 0.4,
  //                      child: ElevatedButton.icon(
  //                        icon: const FaIcon(FontAwesomeIcons.phone),
  //                        style: ElevatedButton.styleFrom(
  //                          backgroundColor: AppColors.cyan,
  //                        ),
  //                        onPressed: () {
  //                          //TODO : Dial
  //                        },
  //                        label: Text(
  //                          'Appeler',
  //                          style: AppTextStyles.blackTextStyle16,
  //                        ),
  //                      ),
  //                    ),
  //                    SizedBox(
  //                      width: Get.width * 0.4,
  //                      child: ElevatedButton.icon(
  //                        icon: const FaIcon(FontAwesomeIcons.whatsapp),
  //                        style: ElevatedButton.styleFrom(
  //                          backgroundColor: AppColors.greenWhatapp,
  //                        ),
  //                        onPressed: () {
  //                          //TODO : whatapp
  //                        },
  //                        label: Text(
  //                          'Whatsapp',
  //                          style: AppTextStyles.blackTextStyle16,
  //                        ),
  //                      ),
  //                    ),
  //                  ],
  //                ),
  //              ),
  //            ),
  //          )
  //        ],
  //      ),
  //    );
  // }