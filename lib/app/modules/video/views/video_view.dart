import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/modules/video/views/video_player.dart';

import '../../../common/service/screenUtils.dart';
import '../controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 10,
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
                     padding: EdgeInsets.only(top: ScreenUtils.width(100),
                     bottom: ScreenUtils.width(100)),
                    color: Colors.black,
                    child: VideoPlayerItem(
                      videoUrl:
                          "https://mall.flutterschool.cn/uploadfile/202404/6c7edb08314ba7c.mp4",
                      thumb:
                          "https://img.flutterschool.cn/202404/3bbc306a80a71f5.jpg",
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
                                        borderRadius: BorderRadius.circular(30),
                                        child: CircleAvatar(
                                          radius: ScreenUtils.width(20),
                                          child: Container(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "mingcheng",
                                        style: TextStyle(
                                            fontSize: ScreenUtils.fontSize(12),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      subtitle: Text(
                                        "fensi233",
                                        style: TextStyle(
                                            fontSize: ScreenUtils.fontSize(12),
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
                                                    ScreenUtils.fontSize(12),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
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
                      child: Text("这是视频描述这是视频描述这是视频描述这是视频描述这是视频描述",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtils.fontSize(14),
                            color: Colors.white,
                          )),
                    ),
                  ),
                  _bottomView(),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  _bottomView() {
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
                          Icon(IconFonts.duomeiti,
                              color: Colors.white, size: 30),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtils.width(6),
                                right: ScreenUtils.width(10)),
                            child: Text("111",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtils.fontSize(12))),
                          ),
                          Icon(IconFonts.xingxing,
                              color: Colors.white, size: 30),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtils.width(6),
                                right: ScreenUtils.width(10)),
                            child: Text("2222",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtils.fontSize(12))),
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
