import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/tool/formatUtil.dart';
import 'package:study/app/modules/video/views/video_player.dart';

import '../../../common/service/screenUtils.dart';
import '../controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              PageView.builder(
                itemCount: controller.videoList.length,
                scrollDirection: Axis.vertical,
                pageSnapping: true,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      AppBar(
                        systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarColor: Colors.black,
                          systemNavigationBarIconBrightness: Brightness.light,
                          statusBarIconBrightness: Brightness.light,
                          statusBarBrightness: Brightness.light,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtils.width(100),
                            bottom: ScreenUtils.width(100)),
                        color: Colors.black,
                        child: VideoPlayerItem(
                          videoUrl: "${controller.videoList[index].videourl}",
                          thumb: "${controller.videoList[index].thumb}",
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtils.width(70),
                                left: ScreenUtils.width(20),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                                size: ScreenUtils.width(24),
                              ),
                            ),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 90,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: ScreenUtils.width(10),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: CircleAvatar(
                                              radius: ScreenUtils.width(20),
                                              child: Image.network(
                                                "${controller.videoList[index].head}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "${controller.videoList[index].author}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtils.fontSize(12),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          subtitle: Text(
                                            "粉丝${controller.videoList[index].count}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtils.fontSize(12),
                                                color: Colors.white),
                                          ),
                                          trailing: Container(
                                              padding: EdgeInsets.only(
                                                  right: ScreenUtils.width(10),
                                                  left: ScreenUtils.width(10),
                                                  top: ScreenUtils.width(4),
                                                  bottom: ScreenUtils.width(4)),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                "关注",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtils.fontSize(
                                                            12),
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                      Positioned(
                        bottom: 70,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: ScreenUtils.width(20),
                              right: ScreenUtils.width(20)),
                          child: Text("${controller.videoList[index].title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtils.fontSize(14),
                                color: Colors.white,
                              )),
                        ),
                      ),
                      _bottomView(index),
                    ],
                  );
                },
                onPageChanged: (index) {
                  if (index + 2 == controller.videoList.length) {
                    controller.getVideoListData(controller.videoList[0].catid);
                  }
                },
              )
            ],
          )),
    );
  }

  _bottomView(index) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: ScreenUtils.height(55),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtils.width(20),
                              right: ScreenUtils.width(6),
                            ),
                            child: const Icon(
                              IconFonts.danmu,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Container(
                            width: ScreenUtils.width(100),
                            height: ScreenUtils.height(24),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtils.width(10)),
                                  child: Text(
                                    "发弹幕",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtils.fontSize(12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(IconFonts.duomeiti,
                              color: Colors.white, size: 30),
                          Obx(() => Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtils.width(6),
                                    right: ScreenUtils.width(10)),
                                child: Text(
                                    numFormat(int.parse(
                                        "${controller.videoList[index].hits}")),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtils.fontSize(12))),
                              )),
                          const Icon(IconFonts.xingxing,
                              color: Colors.white, size: 30),
                          Obx(
                            () => Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtils.width(6),
                                  right: ScreenUtils.width(10)),
                              child: Text(
                                  numFormat(int.parse(
                                      "${controller.videoList[index].count}")),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtils.fontSize(12))),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtils.width(6),
                                right: ScreenUtils.width(20)),
                            child: Icon(IconFonts.pinglun,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
