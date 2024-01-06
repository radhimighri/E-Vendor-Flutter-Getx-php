import 'package:ecommercephpsql/view/widget/home/customcardhome.dart';
import 'package:ecommercephpsql/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

// import '../../controller/home_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/myfavoritecontroller.dart';
import '../../core/class/handlingdataview.dart';

import '../widget/home/customappbar.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp()); // HomeControllerImp injection

    MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar(
                titleappbar: "000".tr,
                onPressedSearch: () {},
                // onPressedIcon: () {},
                onPressedIconFavorite: () {
                  myFavoriteController.goToFavoriteScreen();
                },
                showFavoriteIconBtn: true,
              ),
              const CustomCardHome(
                title: "A summer surprise",
                body: "Cashback 20%",
              ),
              CustomTitleHome(title: "00".tr),
              const ListCategoriesHome(),
              CustomTitleHome(title: "01".tr),
              const ListItemsHome(),
              CustomTitleHome(title: "02".tr),
              const ListItemsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
