import 'package:ecommercephpsql/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/items_data.dart';
import '../data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat({required int selectedCatIndex, required int selectedCatID});
  getItems({required int categoryid});
  goToPageProductDetails(ItemsModel itemsModel);

  // demo(int isFavorite);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  int? catid;

  bool active = false;
  List data = [];

  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  // @override
  // demo(int isFavorite) {
  //   print(isFavorite);
  //   if (isFavorite == 0) {
  //     isFavorite = 1;
  //     update();
  //   } else {
  //     isFavorite = 0;
  //     update();
  //   }
  //   print(isFavorite);
  // }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(categoryid: catid!);
  }

  // @override
  // changeCat(val) {
  //   selectedCat = val;
  //   // print(selectedCat);
  //   update();
  // }

  @override
  changeCat({required selectedCatIndex, required selectedCatID}) {
    selectedCat = selectedCatIndex;
    // catid = selectedCatID;
    getItems(categoryid: selectedCatID);
    update();
  }

  @override
  getItems({required categoryid}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id") ?? "");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
