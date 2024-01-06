import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../view/screen/home.dart';
import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  goToCartInterface();
  changePage(int selectedPageIndex);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "Settings",
          ),
        ),
      ],
    ),

    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "Profile",
          ),
        ),
      ],
    ),
    Settings()
    //  Text(
    //   "Favorite",
    // ),
  ];

  @override
  goToCartInterface() {
    Get.toNamed(AppRoute.cart);
  }

  // List titlebottomappbar = [
  //   "001".tr,
  //   "002".tr,
  //   "003".tr,
  //   "004".tr,
  // ];

  // List<IconData> iconbottomappbar = [
  //   Icons.home,
  //   Icons.settings,
  //   Icons.person,
  //   Icons.favorite,
  // ];

//replace 2 lists by a single map
  List bottomappbar = [
    {"title": "001".tr, "icon": Icons.home},
    {"title": "004".tr, "icon": Icons.notifications_active_outlined},
    {"title": "003".tr, "icon": Icons.person_pin_sharp},
    {"title": "002".tr, "icon": Icons.settings},
  ];

  @override
  changePage(int selectedPageIndex) {
    currentpage = selectedPageIndex;
    update();
  }
}
