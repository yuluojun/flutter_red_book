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
                      _bottomView(context, index),
                    ],
                  );
                },
                onPageChanged: (index) {
                  controller.getSlideVideoData(index);
                  if (index + 2 == controller.videoList.length) {
                    controller.getVideoListData(controller.videoList[0].catid);
                  }
                },
              )
            ],
          )),
    );
  }

  _bottomView(context, index) {
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
                              size: 24,
                            ),
                          ),
                          Container(
                            width: ScreenUtils.width(100),
                            height: ScreenUtils.height(20),
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
                                      fontSize: ScreenUtils.fontSize(11),
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
                              color: Colors.white, size: 24),
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
                          InkWell(
                            onTap: () {
                              controller.doCollect(context, index);
                            },
                            child: Obx(() => Icon(IconFonts.xingxing,
                                color: controller.isCollected.value
                                    ? Colors.orangeAccent
                                    : Colors.white,
                                size: 24)),
                          ),
                          Obx(
                            () => InkWell(
                              onTap: () {
                                controller.doCollect(context, index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtils.width(6),
                                    right: ScreenUtils.width(10)),
                                child: controller.videoData.value.count != null
                                    ? Text(
                                        numFormat(controller.collectNum.value +
                                            int.parse(
                                                "${controller.videoList[index].count}")),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtils.fontSize(12)))
                                    : controller.videoList.length > 1
                                        ? Text(
                                            numFormat(controller
                                                    .collectNum.value +
                                                int.parse(
                                                    "${controller.videoList[0].count}")),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    ScreenUtils.fontSize(12)))
                                        : Text("0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    ScreenUtils.fontSize(12))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  builder: (context) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          _getHeaderLayout(),
                                          Expanded(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 20,
                                                itemBuilder: (context, index) {
                                                  return _getItemComment();
                                                }),
                                          ),
                                          _getBottomLayout(),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtils.width(6),
                                  right: ScreenUtils.width(20)),
                              child: const Icon(IconFonts.pinglun,
                                  color: Colors.white, size: 24),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

  //头部布局
  _getHeaderLayout() {
    return SizedBox(
      height: ScreenUtils.height(43),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: ScreenUtils.height(10),
            child: Text(
              '共128条评论',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtils.fontSize(16)),
            ),
          ),
          Positioned(
            top: ScreenUtils.height(10),
            right: ScreenUtils.height(10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.close,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //获取评论
  _getItemComment() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          left: ScreenUtils.width(20),
          right: ScreenUtils.width(20),
          bottom: ScreenUtils.width(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "张三",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "测试评论内容",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("2024.3.22",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '回复',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          const Column(
            children: [
              Icon(
                Icons.favorite_rounded,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                "800",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getBottomLayout() {
    return SizedBox(
      height: ScreenUtils.height(40),
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: ScreenUtils.width(10),
                bottom: ScreenUtils.width(10),
                top: ScreenUtils.height(8)),
            margin: EdgeInsets.only(
                left: ScreenUtils.width(10), right: ScreenUtils.width(6)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 227, 227, 227)),
            child: const Text(
              "留下您的精彩评论吧",
              style: TextStyle(color: Colors.grey),
            ),
          ))
        ],
      ),
    );
  }
}
