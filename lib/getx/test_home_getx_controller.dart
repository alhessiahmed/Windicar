import 'package:get/get.dart';
import 'package:logo/model/test_car.dart';

class TestHomeGetxController extends GetxController {
  // final loading = false.obs;
  // final items = <Car>[].obs;
  bool loading = false;
  List<TestCar> items = <TestCar>[];

  @override
  void onInit() async {
    await read();
    super.onInit();
  }

  Future<void> read() async {
    // loading(true);
    loading = true;
    // items.value = fillList();
    items = fillList();
    // loading(false);
    loading = false;
    update();
  }

  Future<void> toggleFavorite({
    required index,
  }) async {
    items[index].isFav = !items[index].isFav;
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
        isFav: false,
      ),
      TestCar(
        id: 2,
        imgUrls: ['assets/images/car.png'],
        title: 'BMW Loz 63',
        subtitle: '310 DH/Jour',
        rating: '4.6',
        isFav: false,
      ),
      TestCar(
        id: 3,
        imgUrls: ['assets/images/car.png'],
        title: 'Lambornini 63',
        subtitle: '320 DH/Jour',
        rating: '4.7',
        isFav: false,
      ),
      TestCar(
        id: 4,
        imgUrls: ['assets/images/car.png'],
        title: 'Toyota yoyo 63',
        subtitle: '330 DH/Jour',
        rating: '4.8',
        isFav: false,
      ),
      TestCar(
        id: 5,
        imgUrls: ['assets/images/car.png'],
        title: 'Hyonda huhu 63',
        subtitle: '340 DH/Jour',
        rating: '4.9',
        isFav: false,
      ),
      TestCar(
        id: 6,
        imgUrls: ['assets/images/car.png'],
        title: 'Tesla Space X',
        subtitle: '340 DH/Jour',
        rating: '4.9',
        isFav: false,
      ),
      TestCar(
        id: 7,
        imgUrls: ['assets/images/car.png'],
        title: 'Batata Zakya',
        subtitle: '340 DH/Jour',
        rating: '4.9',
        isFav: false,
      ),
      TestCar(
        id: 8,
        imgUrls: ['assets/images/car.png'],
        title: 'Shawarma Zakya',
        subtitle: '340 DH/Jour',
        rating: '4.9',
        isFav: false,
      ),
    ];
  }
}
