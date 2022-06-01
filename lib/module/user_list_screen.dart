import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_api_calling/module/userListScreen/controller/UserListScreenController.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserListScreenController userListScreenController =
      Get.put(UserListScreenController());

  @override
  void initState() {
    userListScreenController.getUserFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () => ListView.builder(
            itemCount: userListScreenController.usersList.length,
            itemBuilder: (context, index) => Container(
              child:
                  Text(userListScreenController.usersList[index].email ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}
