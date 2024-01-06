import 'package:ecommercephpsql/controller/favorite_controller.dart';
import 'package:ecommercephpsql/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/home/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp()); //inject the Items controller

    FavoriteController favoriteContrller = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              CustomAppBar(
                titleappbar: "000".tr,
                // onPressedIcon: () {},
                onPressedSearch: () {},
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavroite);
                },
                showFavoriteIconBtn: true,
              ),
              const SizedBox(height: 10),
              const ListCategoriesItems(),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.62),
                  itemBuilder: (BuildContext context, index) {
                    favoriteContrller
                            .isFavorite[controller.data[index]['items_id']] =
                        controller.data[index]['favorite'];

                    // print(
                    //     "DEBUG:::: ItemID: ${favoriteContrller.isFavorite[controller.data[index]['items_id']]} ===> isFavorite: ${controller.data[index]['favorite']}");

                    // favoriteContrller.isFavorite[
                    //         ItemsModel.fromJson(controller.data[index])
                    //             .itemsId
                    //             .toString()] =
                    //     ItemsModel.fromJson(controller.data[index])
                    //         .isFavorite
                    //         .toString();

                    favoriteContrller.isFavorite.forEach((key, value) {
                      print(
                          "$key ${key.runtimeType} ==> $value ${key.runtimeType}");
                    });

                    return CustomListItems(
                      itemsModel: ItemsModel.fromJson(
                        controller.data[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
