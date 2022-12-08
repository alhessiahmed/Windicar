import 'package:get/get.dart';
import 'package:logo/model/car.dart';
import 'package:logo/model/test_car.dart';

class FavoriteScreenController extends GetxController {
  bool loading = false;
  List<TestCar> items = [];

  @override
  void onInit() async {
    await read();
    super.onInit();
  }

  Future<void> read() async {
    loading = true;
    await Future.delayed(
      Duration(seconds: 3),
      () {
        items = fillList();
      },
    );
    loading = false;
    update();
  }

  Future<void> toggleFavorite({
    required index,
  }) async {
    items[index].isFav = !items[index].isFav;
    items.removeAt(index);
    update();
  }

  List<TestCar> fillList() {
    return [
      TestCar(
        id: 1,
        imgUrls: ['assets/images/car.png'],
        title: 'Mercedes gt 63',
        subtitle: '300 DH/Jour',
        rating: '4.5',
        isFav: true,
      ),
      TestCar(
        id: 2,
        imgUrls: ['assets/images/car.png'],
        title: 'BMW Loz 63',
        subtitle: '310 DH/Jour',
        rating: '4.6',
        isFav: true,
      ),
      TestCar(
        id: 3,
        imgUrls: ['assets/images/car.png'],
        title: 'Lambornini 63',
        subtitle: '320 DH/Jour',
        rating: '4.7',
        isFav: true,
      ),
      TestCar(
        id: 4,
        imgUrls: ['assets/images/car.png'],
        title: 'Toyota yoyo 63',
        subtitle: '330 DH/Jour',
        rating: '4.8',
        isFav: true,
      ),
      TestCar(
        id: 5,
        imgUrls: ['assets/images/car.png'],
        title: 'Hyonda huhu 63',
        subtitle: '340 DH/Jour',
        rating: '4.9',
        isFav: true,
      ),
    ];
  }
}
