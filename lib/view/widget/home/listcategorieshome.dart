import 'package:ecommercephpsql/controller/home_controller.dart';
import 'package:ecommercephpsql/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetWidget<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesHome(
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

class CategoriesHome extends GetWidget<HomeControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const CategoriesHome({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(
        //   categories: controller.categories,
        //   selectedCat: i ?? 0,
        // );

        controller.goToItems(
            categories: controller.categories,
            selectedCat: i!,
            categoryid: categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${translateDatabase(
              categoriesModel.categoriesNameAr,
              categoriesModel.categoriesName?.toUpperCase(),
            )}",
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.black,
            ),
          )
        ],
      ),
    );
  }
}
