import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productdetails_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/productdetails/priceandcount.dart';
import '../widget/productdetails/subitemslist.dart';
import '../widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {
            controller.goToCartInterface();
          },
          child: const Text(
            "Go To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
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
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${controller.itemsModel.itemsName}",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: AppColor.fourthColor,
                            )),
                    const SizedBox(height: 10),
                    PriceAndCountItems(
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        price: "${controller.itemsModel.itemsPrice}",
                        count: "${controller.countitems}"),
                    const SizedBox(height: 10),
                    Text("${controller.itemsModel.itemsDesc}",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColor.grey2)),
                    const SizedBox(height: 10),
                    // Text("Color",
                    //     style: Theme.of(context).textTheme.headline1!.copyWith(
                    //           color: AppColor.fourthColor,
                    //         )),
                    // const SizedBox(height: 10),
                    // const SubitemsList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
