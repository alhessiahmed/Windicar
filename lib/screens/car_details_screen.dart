import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logo/getx/car_details_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custome_bottom_navigation_bar.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen({
    required this.id,
    super.key,
  });
  final int id;

  final List<Car> temp = [
    Car(
      id: 1,
      imgUrls: ['assets/images/car.png'],
      title: 'Mercedes gt 63',
      subtitle: '300 DH/Jour',
      rating: '4.5',
      isFav: false,
    ),
    Car(
      id: 2,
      imgUrls: ['assets/images/car.png'],
      title: 'BMW Loz 63',
      subtitle: '310 DH/Jour',
      rating: '4.6',
      isFav: false,
    ),
    Car(
      id: 3,
      imgUrls: ['assets/images/car.png'],
      title: 'Lambornini 63',
      subtitle: '320 DH/Jour',
      rating: '4.7',
      isFav: false,
    ),
    Car(
      id: 4,
      imgUrls: ['assets/images/car.png'],
      title: 'Toyota yoyo 63',
      subtitle: '330 DH/Jour',
      rating: '4.8',
      isFav: false,
    ),
    Car(
      id: 5,
      imgUrls: ['assets/images/car.png'],
      title: 'Hyonda huhu 63',
      subtitle: '340 DH/Jour',
      rating: '4.9',
      isFav: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 64.r,
        leading: Row(
          children: [
            SizedBox(
              width: 16.w,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
            onTap: () {},
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
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              // radius: 12.r,
              child: Icon(
                Icons.favorite_border_rounded,
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
      body: GetBuilder(
        init: CarDetailsGetxController(),
        builder: (CarDetailsGetxController controller) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 284.h,
                child: Stack(
                  children: [
                    PageView(
                      // controller: controller.pageController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int newImgIndex) {
                        controller.updateImgIndex(index: newImgIndex);
                      },
                      children: getPictures(),
                    ),
                    Positioned(
                      bottom: 10.5.h,
                      left: (Get.width * 0.5) - 39,
                      child: SizedBox(
                        width: 78.w,
                        height: 11.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              backgroundColor: controller.imgIndex == index
                                  ? AppColors.white
                                  : AppColors.whiteWithOpacity,
                              // backgroundColor: AppColors.whiteWithOpacity,
                              radius: 6.r,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 4.w),
                          itemCount: 5,
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
                          'Mercedes gt 63',
                          style: AppTextStyles.textStyle17,
                        ),
                        const Spacer(),
                        Text(
                          '300 DH',
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
                    Row(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushNamed(context, '/supplier_screen');
                          },
                          child: CircleAvatar(
                            radius: 33.w,
                            backgroundColor: AppColors.darkGreen,
                            child: CircleAvatar(
                              radius: 30.w,
                              backgroundColor: AppColors.white,
                              backgroundImage: const NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mark stephane',
                              style: AppTextStyles.textStyle16,
                            ),
                            Text(
                              'Casablanca',
                              style: AppTextStyles.darkGreenTextStyle14,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset('assets/images/star.png'),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '4.8',
                          style: AppTextStyles.textStyle16,
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
                          'Essence',
                          style: AppTextStyles.textStyle16,
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        SvgPicture.asset('assets/images/ic_engine.svg'),
                        Text(
                          'Manuel',
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
                      padding: EdgeInsetsDirectional.only(start: 8.w, top: 8.h),
                      child: Text(
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
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: temp.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 166.w / 220.h,
                ),
                itemBuilder: (context, index) {
                  return CarCard(
                    id: temp[index].id,
                    imgUrl: temp[index].imgUrls.first,
                    title: temp[index].title,
                    subtitle: temp[index].subtitle,
                    rating: temp[index].rating,
                    isFav: temp[index].isFav,
                    onTap: () {},
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

List<Widget> getPictures() {
  List<Widget> items = [];
  for (var i = 0; i < 5; i++) {
    items.add(
      Image.asset(
        'assets/images/car2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
  return items;
}
