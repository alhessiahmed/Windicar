import 'package:get/get.dart';
import 'package:logo/api/controllers/favorite_api_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/favorite_car.dart';

class FavoriteGetxController extends GetxController {
  bool isLoading = false;
  List<FavoriteCar> favoriteCars = [];

  @override
  void onInit() async {
    await readFavorites();
    super.onInit();
  }

  Future<void> readFavorites() async {
    isLoading = true;
    favoriteCars = await FavoriteApiController().readFavoriteCars();
    isLoading = false;
    update();
  }

  Future<void> deleteFavorite({required int index}) async {
    ApiResponse response = await FavoriteApiController().toggleFavorite(
      id: favoriteCars[index].id,
      wasFavorite: true,
    );
    if (response.success) {
      favoriteCars.removeAt(index);
      update();
    }
  }
}
