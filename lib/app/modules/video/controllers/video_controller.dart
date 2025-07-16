import 'dart:convert';

import 'package:get/get.dart';
import 'package:study/app/common/constant/constants.dart';
import 'package:study/app/common/service/httpsApis.dart';
import 'package:study/app/common/tool/is_empty.dart';
import 'package:study/app/common/tool/shared_preference.dart';
import 'package:study/app/common/tool/toast.dart';
import 'package:study/app/models/video_model.dart';
import 'package:study/app/modules/videoLibrary/controllers/video_library_controller.dart';

import '../../../common/service/httpsApi.dart';
import '../../../models/banner_list.dart';

class VideoController extends GetxController {
  RxList<BannerListData> videoList = <BannerListData>[].obs;
  VideoLibraryController videoLibraryController = Get.put(VideoLibraryController());
  HttpsApi httpsApi = HttpsApi();
  HttpsApis httpsApis = HttpsApis();
  RxInt page = 1.obs;
  RxInt pagesize = 10.obs;
  RxBool isCollected = false.obs;
  var videoData = VideoModelData().obs;
  RxInt collectNum = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getVideoData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getVideoData() async {
    var apiUrl = "video/vid/${Get.arguments["vid"]}/";
    var response = await httpsApi.get(apiUrl);
    print(response);
    if (response.data != null) {
      var listJsonData = BannerList.fromJson(response.data);
      videoList.addAll(listJsonData.data!);
      getVideoListData(videoList[0].catid);
      getCollectNum(Get.arguments["vid"]);
      getSlideVideoData(0);
    }
    update();
  }

  getVideoListData(catid) async {
    //https://mall.flutterschool.cn/list/id/视频分类id/page/$page/pagesize/5/
    var apiUrl = "list/id/$catid/page/$page/pagesize/$pagesize/";
    var response = await httpsApi.get(apiUrl);
    print(response);
    if (response.data != null) {
      var listJsonData = BannerList.fromJson(response.data);
      videoList.addAll(listJsonData.data!);
      page.value++;
    }
    update();
  }

  // 收藏
  doCollect(context, index) async {
    // https://p.flutterschool.cn/api/collect/add/
    var userName = await SharedPreference.getString(Constants.USER_NAME);
    if (userName != null && !isEmpty(userName)) {
      var apiUrl = "api/collect/add/";
      var params = {
        "username": userName,
        "vid": videoList[index].vid,
        "head": videoList[index].head,
        "author": videoList[index].author,
      };
      var response = await httpsApis.post(apiUrl, data: params);
      if (response != null) {
        print(json.decode(response));
        if (json.decode(response.data)["success"] == 1) {
          Toast.getToast(context, "收藏成功");
          isCollected.value = true;
          getCollectNum(videoList[index].vid);
        } else {
          Toast.getToast(context, "已取消收藏");
          isCollected.value = false;
          getCollectNum(videoList[index].vid);
        }
        videoLibraryController.refreshVideoData();
      }
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.toNamed("/login");
      });
    }
    update();
  }

  getCollectStatus() async {
    var userName = await SharedPreference.getString(Constants.USER_NAME);
    var apiUrl = "api/collect/status/";
    var params = {
      "username": userName,
      "vid": Get.arguments["vid"],
    };
    var response = await httpsApis.post(apiUrl, data: params);
    if (response != null) {
      print(json.decode(response));
    }
  }

  getSlideVideoData(index) async {
    var apiUrl = "video/id/${videoList[index].id}/";
    var response = await httpsApi.get(apiUrl);
    if (response != null) {
      var videoJson = VideoModel.fromJson(response.data);
      videoData.value = videoJson.data!;
    }
    var userName = await SharedPreference.getString(Constants.USER_NAME);
    var collectApiUrl = "api/collect/status/";
    var params = {
      "username": userName,
      "vid": videoList[index].vid,
    };
    var res = await httpsApis.post(collectApiUrl, data: params);
    if (res != null) {
      print(json.decode(res));
      if (json.decode(res.data)["success"] == 1) {
        isCollected.value = true;
      } else {
        isCollected.value = false;
      }
    }
    update();
  }

  getCollectNum(vid) async {
    var apiUrl = "/api/collect/vcount/?v=$vid";
    var response = await httpsApis.get(apiUrl);
    var videoCollect = json.decode(response.data);
    collectNum.value = videoCollect["data"]["count"];
    update();
  }
}
