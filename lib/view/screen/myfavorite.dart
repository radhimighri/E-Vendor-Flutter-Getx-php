import 'package:ecommercephpsql/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/myfavoritecontroller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/home/customappbar.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  loadMyFavoriteData() async {
    MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());

    await myFavoriteController.loadMyFavoriteData();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(MyFavoriteController());
    // Get.lazyPut(() {
    //   MyFavoriteController();
    // }, fenix: false);

    loadMyFavoriteData();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: ((myFavoriteController) {
            return ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  // onPressedIcon: () {},
                  onPressedSearch: () {},
                  onPressedIconFavorite: () {
                    // controller.goToFavoriteScreen();
                  },
                  showFavoriteIconBtn: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                  statusRequest: myFavoriteController.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myFavoriteController.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                        itemsModel: myFavoriteController.data[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
