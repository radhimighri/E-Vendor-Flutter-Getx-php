import 'package:ecommercephpsql/controller/items_controller.dart';
import 'package:ecommercephpsql/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';

class ListCategoriesItems extends GetWidget<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesItems(
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
            i: index,
          );
        },
      ),
    );
  }
}

class CategoriesItems extends GetWidget<ItemsControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const CategoriesItems({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(
            "DEBUG::: Selected category name : ${categoriesModel.categoriesNameAr}");
        print(
            "DEBUG::: Selected category ID : ${categoriesModel.categoriesId}");

        controller.changeCat(
          selectedCatIndex: (i ?? 0),
          selectedCatID: (categoriesModel.categoriesId ?? 0),
        );

        // controller.changeCat(i ?? 0, controller.catid ?? 0);
        // print("dd");
        // controller.goToItems(
        //   categories: controller.categories,
        //   selectedCat: 0,
        // );
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                " ${translateDatabase(
                  categoriesModel.categoriesNameAr,
                  categoriesModel.categoriesName?.toUpperCase(),
                )}",
                style: TextStyle(
                  fontSize: 19,
                  color: controller.selectedCat == i
                      ? AppColor.primaryColor
                      : AppColor.grey2,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
