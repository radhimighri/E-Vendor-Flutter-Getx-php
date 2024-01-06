import 'package:ecommercephpsql/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems({
    required List categories,
    required int selectedCat,
    required int categoryid,
  });
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homedata = HomeData(Get.find());
  // List data = [];
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;

  String? username;
  String? id;
  String? lang;

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Home Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']["data"]);
        items.addAll(response['items']["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems({
    required categories,
    required selectedCat,
    required categoryid,
  }) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "catid": categoryid
      },
    );
  }
}
