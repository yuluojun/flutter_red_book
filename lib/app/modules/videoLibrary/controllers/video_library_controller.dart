import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study/app/common/constant/constants.dart';
import 'package:study/app/common/service/httpsApi.dart';
import 'package:study/app/common/tool/shared_preference.dart';
import 'package:study/app/models/banner_list.dart';

class VideoLibraryController extends GetxController {
  RxList<BannerListData> videoList = <BannerListData>[].obs;
  ScrollController scrollController = ScrollController();
  HttpsApi httpsApi = HttpsApi();
  RxBool hasData = true.obs;
  RxInt page = 1.obs;
  RxInt pagesize = 10.obs;
  RxBool isFlag = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getVideoData();
  }

  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent - 30)) {
        getVideoData();
      }
    });
  }

  getVideoData() async {
    var userName = SharedPreference.getString(Constants.USER_NAME);
    if (isFlag.value && hasData.value) {
      isFlag.value = false;
      var apiUrl =
          "collectlist/u/$userName/page/${page.value}/pagesize/$pagesize/";
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
    }
    update();
  }

  refreshVideoData() async {
    var username = await SharedPreference.getString(Constants.USER_NAME);
    if (username != null) {
      var apiUrl = "collectlist/u/$username/page/1/pagesize/$pagesize/";
      var response = await httpsApi.get(apiUrl);
      if (response != null) {
        videoList.clear();
        var listJsonData = BannerList.fromJson(response.data);
        videoList.addAll(listJsonData.data!);
        // 重置下配置
        page.value = 2;
        hasData.value = true;
        isFlag.value = true;
      }
      update();
    }
  }


}
