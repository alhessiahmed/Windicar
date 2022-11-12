import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.homeAppBar,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('data'),
                ),
                Expanded(
                  flex: 2,
                  child: Text('00'),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder(
            init: HomeGetxController(),
            builder: (HomeGetxController controller) {
              if (controller.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16.r),
                    itemCount: controller.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 166.w / 220.h,
                    ),
                    itemBuilder: (context, index) {
                      return CarCard(
                        id: controller.items[index].id,
                        imgUrl: controller.items[index].imgUrl,
                        title: controller.items[index].title,
                        subtitle: controller.items[index].subtitle,
                        rating: controller.items[index].rating,
                        isFav: controller.items[index].isFav,
                        onTap: (() async =>
                            await controller.toggleFavorite(index: index)),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.isFav,
    required this.id,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final String subtitle;
  final String rating;
  final bool isFav;
  final int id;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsScreen(
              id: id,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: AppColors.white,
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
                    fit: BoxFit.fill,
                  ),
                ),
                PositionedDirectional(
                  top: 8.h,
                  end: 8.h,
                  child: InkWell(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 16.r,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.darkGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Text(
                    title,
                    style: AppTextStyles.cardBlackTextStyle,
                  ),
                  const Spacer(),
                  Image.asset('assets/images/star.png'),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    rating,
                    style: AppTextStyles.ratingTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                subtitle,
                style: AppTextStyles.cardGreenTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
