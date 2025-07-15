import 'package:get/get.dart';

import '../../../common/service/httpsApi.dart';
import '../../../models/banner_list.dart';

class VideoController extends GetxController {
  RxList<BannerListData> videoList = <BannerListData>[].obs;
  HttpsApi httpsApi = HttpsApi();
  RxInt page = 1.obs;
  RxInt pagesize = 10.obs;

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
    }
    update();
  }

  getVideoListData(catid) async{
    //https://mall.flutterschool.cn/list/id/视频分类id/page/$page/pagesize/5/
    var apiUrl = "list/id/$catid/page/$page/pagesize/$pagesize/";
    var response = await httpsApi.get(apiUrl);
    print(response);
    if (response.data != null) {
      var listJsonData = BannerList.fromJson(response.data);
      videoList.addAll(listJsonData.data!);
      page.value ++;
    }
    update();
  }
}
