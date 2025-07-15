import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:study/app/common/service/httpsApi.dart';
import '../../../../models/banner_list.dart';

class HomeController extends GetxController {
  RxList<BannerListData> bannerList = <BannerListData>[].obs;
  RxList<BannerListData> videoList = <BannerListData>[].obs;
  ScrollController scrollController = ScrollController();
  HttpsApi httpsApi = HttpsApi();
  RxInt page = 1.obs;
  RxInt pagesize = 10.obs;
  RxBool isFlag = true.obs;
  RxBool hasData = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getBannerData();
    getVideoData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 30)) {
        getVideoData();
      }
    });
  }

  getBannerData() async {
    var apiUrl = "list/id/13/page/1/pagesize/10/";
    var response = await httpsApi.get(apiUrl);
    print(response);
    if (response.data != null) {
      var listJsonData = BannerList.fromJson(response.data);
      bannerList.value = listJsonData.data!;
    }
    update();
  }

  getVideoData() async {
    if (isFlag.value && hasData.value) {
      isFlag.value = false;
      var apiUrl =
          "recommendvideo/page/$page/pagesize/$pagesize/";
      var response = await httpsApi.get(apiUrl);
      print(response);
      if (response.data != null) {
        var listJsonData = BannerList.fromJson(response.data);
        page.value++;
        isFlag.value = true;
        videoList.addAll(listJsonData.data!);
        if (listJsonData.data!.length < pagesize.value) {
          hasData.value = false;
          isFlag.value = false;
        }
      }
      update();
    }
  }
}
