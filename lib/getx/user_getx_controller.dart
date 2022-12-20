import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/api/controllers/user_api_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/user.dart';

class UserGetxController extends GetxController {
  UserGetxController({required this.userId});

  final int userId;
  bool isLoading = false;
  User? user;

  @override
  void onInit() async {
    await readUser();
    super.onInit();
  }

  Future<ApiResponse> deleteCar({required int id}) async {
    // user!.cars.removeWhere((element) => element.id == id);
    // update();
    return await CarApiController().deleteCar(id: id);
  }

  Future<void> readUser() async {
    isLoading = true;
    user = await UserApiController().readUserDetails(id: userId);
    isLoading = false;
    update();
  }
}
