import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_api_calling/core/api_service.dart';
import 'package:get_api_calling/model/user_model.dart';

class UserListScreenController extends GetxController {
  RxList<User> usersList = <User>[].obs;

  void getUserFromAPI() async {
    usersList.value = await ApiService().getUser();
  }
}
