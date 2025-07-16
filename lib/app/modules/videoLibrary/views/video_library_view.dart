import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/service/keepAliveWrapper.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:study/app/common/tool/formatUtil.dart';
import 'package:study/app/common/tool/loading.dart';

import '../controllers/video_library_controller.dart';

class VideoLibraryView extends GetView<VideoLibraryController> {
  const VideoLibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Stack(
      children: [
        _homePage(),
        _appBar(),
      ],
    ));
  }

  _homePage() {
    return Positioned(
        top: 40,
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView(
          controller: controller.scrollController,
          children: [
            _videoList(),
          ],
        ));
  }

  _videoList() {
    return Column(
      children: [
        Obx(() => controller.videoList.isNotEmpty
            ? Container(
                padding: EdgeInsets.only(
                    top: ScreenUtils.width(10),
                    left: ScreenUtils.width(10),
                    right: ScreenUtils.width(10),
                    bottom: ScreenUtils.width(20)),
                color: Colors.white,
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenUtils.width(10),
                  crossAxisSpacing: ScreenUtils.width(10),
                  itemCount: controller.videoList.length,
                  shrinkWrap: true,
                  // 高度自适应收缩
                  physics: const NeverScrollableScrollPhysics(),
                  // 禁止滚动
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        clipBehavior: Clip.hardEdge, // 超出部分可裁剪
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(
                                    ScreenUtils.width(1), ScreenUtils.width(1)),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: ScreenUtils.width(200),
                                  width: double.infinity,
                                  child: Image.network(
                                      "${controller.videoList[index].thumb}",
                                      fit: BoxFit.cover),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      top: ScreenUtils.width(6),
                                      left: ScreenUtils.width(10),
                                      right: ScreenUtils.width(10),
                                      bottom: ScreenUtils.width(10)),
                                  child: Text(
                                    "${controller.videoList[index].title}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ScreenUtils.fontSize(13),
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenUtils.width(10),
                                              bottom: ScreenUtils.width(20)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CircleAvatar(
                                              radius: ScreenUtils.width(10),
                                              child: Image.network(
                                                  "${controller.videoList[index].head}",
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenUtils.width(6),
                                              bottom: ScreenUtils.width(20)),
                                          child: Text(
                                            "${controller.videoList[index].author}",
                                            style: TextStyle(
                                              fontSize:
                                                  ScreenUtils.fontSize(11),
                                              color: Colors.black87,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: ScreenUtils.width(20)),
                                          child: const Icon(
                                            IconFonts.duomeiti,
                                            size: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: ScreenUtils.width(20),
                                              left: ScreenUtils.width(6),
                                              right: ScreenUtils.width(10)),
                                          child: Text(
                                              numFormat(int.parse(controller
                                                  .videoList[index].hits!)),
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenUtils.fontSize(11),
                                                color: Colors.black87,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 10,
                              left: 0,
                              right: -130,
                              child: CircleAvatar(
                                  radius: ScreenUtils.width(10),
                                  backgroundColor: Colors.grey,
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 13,
                                  )),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.toNamed("/video", arguments: {
                          "vid": controller.videoList[index].vid,
                        });
                      },
                    );
                  },
                ),
              )
            : Loading.progressIndicator()),
        Obx(() => controller.hasData.value == false
            ? Loading.loadingText("---没有更多数据---")
            : const Text(""))
      ],
    );
  }

  _appBar() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: ScreenUtils.height(55),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "收藏库",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtils.fontSize(20),
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtils.width(20)),
                  child: Icon(
                    IconFonts.sousuo,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
