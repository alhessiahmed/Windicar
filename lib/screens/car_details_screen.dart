import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logo/getx/car_details_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/model/car_image.dart';
import 'package:logo/screens/supplier_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custome_bottom_navigation_bar.dart';
import 'package:share_plus/share_plus.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen({
    required this.id,
    required this.isFav,
    // required this.route,
    super.key,
  });
  final int id;
  // final String route;
  bool isFav;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: AppColors.darkGreen,
    //   ),
    // );

    // return AnnotatedRegion<SystemUiOverlayStyle>(
    // value: SystemUiOverlayStyle.dark,
    // value: const SystemUiOverlayStyle(
    // statusBarColor: AppColors.darkGreen,
    // ),
    // child:
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: GetBuilder<CarDetailsGetxController>(
            init: CarDetailsGetxController(carId: id),
            builder: (CarDetailsGetxController controller) {
              if (controller.isLoading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                Car? car = controller.carDetails?.car;
                return Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    // systemOverlayStyle: const SystemUiOverlayStyle(
                    //   statusBarColor: AppColors.darkGreen,
                    // ),
                    leadingWidth: 64.r,
                    leading: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        InkWell(
                          onTap: () {
                            // if (controller.favStatusGotUpdated) {
                            //   Navigator.pushNamedAndRemoveUntil(
                            //     context,
                            //     route,
                            //     (r) => false,
                            //   );
                            // } else {
                            Navigator.pop(context);
                            // }
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            // radius: 12.r,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColors.darkGreen,
                              size: 32.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      InkWell(
                        onTap: () {
                          Share.share(controller.carDetails?.car
                                  .images[controller.imgIndex].imageUrl ??
                              'Error');
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          // radius: 12.r,
                          child: Icon(
                            Icons.share_rounded,
                            color: AppColors.darkGreen,
                            size: 32.r,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.toggleFavorite();
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          // radius: 12.r,
                          child: Icon(
                            controller.carDetails?.car.isFavorite ?? false
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: AppColors.darkGreen,
                            size: 32.r,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      )
                    ],
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  body: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: 284.h,
                        child: Stack(
                          children: [
                            Visibility(
                              visible: car?.images.isNotEmpty ?? false,
                              // maintainState: true,
                              // maintainSize: true,
                              // maintainAnimation: true,
                              replacement: const Center(
                                child: Text(
                                  'NO IMAGES TO SHOW',
                                ),
                              ),
                              child: PageView(
                                // controller: controller.pageController,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (int newImgIndex) {
                                  controller.updateImgIndex(index: newImgIndex);
                                },
                                children: getPictures(
                                  controller.carDetails!.car.images,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 32.h,
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CircleAvatar(
                                      backgroundColor:
                                          controller.imgIndex == index
                                              ? AppColors.white
                                              : AppColors.whiteWithOpacity,
                                      // backgroundColor: AppColors.whiteWithOpacity,
                                      radius: 6.r,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 4.w),
                                  itemCount:
                                      controller.carDetails!.car.images.length,
                                  // itemCount: controller.images.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  car?.carName ?? 'Car Name',
                                  style: AppTextStyles.textStyle17,
                                ),
                                const Spacer(),
                                Text(
                                  '${car?.price} DH',
                                  style: AppTextStyles.darkGreenTextStyle17,
                                ),
                                Text(
                                  ' /Jour',
                                  style: AppTextStyles.textStyle17,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Divider(
                            //   thickness: 1,
                            //   color: AppColors.grey,
                            //   height: 24.h,
                            // ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SupplierScreen(
                                      userId:
                                          controller.carDetails!.car.ownerId,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 33.w,
                                    backgroundColor: AppColors.darkGreen,
                                    child: CircleAvatar(
                                      radius: 30.w,
                                      backgroundColor: AppColors.white,
                                      backgroundImage: NetworkImage(
                                        car?.owner!.imageUrl?.isNotEmpty ??
                                                false
                                            ? car!.owner!.imageUrl!
                                            :
                                            // controller.car?.owner?.imageUrl ??
                                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        car?.owner?.name ?? 'User',
                                        style: AppTextStyles.textStyle16,
                                      ),
                                      Text(
                                        car?.city?.name ?? 'City',
                                        style:
                                            AppTextStyles.darkGreenTextStyle14,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.asset('assets/images/star.png'),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    car?.owner?.rate.toString() ?? '0',
                                    style: AppTextStyles.textStyle16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Divider(
                            //   thickness: 1,
                            //   color: AppColors.grey,
                            //   height: 24.h,
                            // ),
                            Text(
                              'Fonctionnalités',
                              style: AppTextStyles.textStyle16,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/ic_fuel.png'),
                                Text(
                                  car?.fueltype ?? 'Essence',
                                  style: AppTextStyles.textStyle16,
                                ),
                                SizedBox(
                                  width: 24.w,
                                ),
                                SvgPicture.asset('assets/images/ic_engine.svg'),
                                Text(
                                  car?.cartype ?? 'Manuel',
                                  style: AppTextStyles.textStyle16,
                                ),
                              ],
                            ),
                            Divider(
                              endIndent: (Get.width / 2).w,
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                            Text(
                              'Description',
                              style: AppTextStyles.textStyle16,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 8.w, top: 8.h),
                              child: Text(
                                car?.description ??
                                    'Le client est très important, le client sera suivi par le client.Pour le besoin très présent, pour plus de commodité,nemportez que ce vulputate. Comme le basket ou pas, la gorge a maintenant quelques.',
                                style: AppTextStyles.textStyle14,
                              ),
                            ),
                            Divider(
                              endIndent: (Get.width / 2).w,
                              color: AppColors.grey,
                              thickness: 1,
                            ),
                            Text(
                              'Autres voitures',
                              style: AppTextStyles.textStyle16,
                            ),
                          ],
                        ),
                      ),
                      controller.carDetails?.similarCars.isNotEmpty ?? false
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount:
                                  controller.carDetails!.similarCars.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 166.w / 220.h,
                              ),
                              itemBuilder: (context, index) {
                                Car similarCar =
                                    controller.carDetails!.similarCars[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CarDetailsScreen(
                                          id: car!.id,
                                          isFav: car.isFavorite,
                                        ),
                                      ),
                                    ).then(
                                        (value) => controller.readCarDetails());
                                  },
                                  child: CarCard(
                                    id: similarCar.id,
                                    imgUrl: similarCar.images.isNotEmpty
                                        ? similarCar.images.first.imageUrl
                                        : null,
                                    title: similarCar.carName,
                                    subtitle: similarCar.price,
                                    rating:
                                        similarCar.owner?.rate?.toString() ??
                                            '0',
                                    isFav: similarCar.isFavorite,
                                    // initialRoute: '/home_screen',
                                    onTap: () {},
                                  ),
                                );
                              },
                            )
                          : Container(),
                    ],
                  ),
                  bottomNavigationBar: CustomBottomNavigationBar(
                    phone: '+212${controller.carDetails?.car.owner?.phone}',
                    // ??
                    //     '00970592464423',
                    supplierId: controller.carDetails!.car.ownerId,
                  ),
                );
              }
            }),
      ),
    );
  }
}

List<Widget> getPictures(List<CarImage> images) {
  List<Widget> items = [];
  for (var i = 0; i < images.length; i++) {
    items.add(
      Image.network(
        images[i].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
  return items;
}
