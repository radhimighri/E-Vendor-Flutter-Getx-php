import 'package:ecommercephpsql/controller/home_controller.dart';
import 'package:ecommercephpsql/data/model/itemsmodel.dart';
import 'package:ecommercephpsql/view/widget/items/customlistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(
              controller.items[i],
            ),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetWidget<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            // "${AppLink.imagestItems}/${controller.items[i]["items_image"]}",
            "${AppLink.imagestItems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 120,
          width: 200,
        ),
        Positioned(
          top: 5,
          right: controller.lang != "en" ? 10 : null,
          left: controller.lang != "ar" ? 10 : null,
          child: Text(
            " ${translateDatabase(
              itemsModel.itemsNameAr,
              itemsModel.itemsName?.toUpperCase(),
            )}",
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              backgroundColor: Colors.black.withOpacity(0.4),
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          right: controller.lang == "en" ? 10 : null,
          left: controller.lang == "ar" ? 10 : null,
          bottom: 20,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              color: Colors.orange.shade800,
            ),
            // alignment: Alignment.center,
            child: Text(
              "${itemsModel.itemsDiscount}%",
              style: const TextStyle(
                // fontFamily: DefaultTextStyle.of(context)
                //     .style
                //     .fontFamily,
                fontFamily: 'Rubik',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
