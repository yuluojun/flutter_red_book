import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/service/keepAliveWrapper.dart';
import 'package:study/app/common/tool/cacheImage.dart';
import 'package:study/app/common/tool/formatUtil.dart';

import '../../../../common/service/screenUtils.dart';
import '../../../../common/tool/loading.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: RefreshIndicator(
            backgroundColor: Colors.white,
            color: Colors.blue,
            child: ListView(
              controller: controller.scrollController,
              children: [
                _swiperView(),
                _videoList(),
              ],
            ),
            onRefresh: () async {
              controller.getBannerData();
              controller.getVideoData();
            }));
  }

  // 轮播图
  _swiperView() {
    return Obx(() => Container(
          padding: EdgeInsets.only(
              left: ScreenUtils.width(10),
              right: ScreenUtils.width(10),
              bottom: ScreenUtils.width(20),
              top: ScreenUtils.width(10)),
          height: ScreenUtils.width(150),
          child: Container(
            clipBehavior: Clip.hardEdge, // 超出部分可裁剪
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(246, 246, 246, 1)),
            child: Swiper(
              itemCount: controller.bannerList.length,
              itemBuilder: (BuildContext context, int index) {
                // return Image.asset(
                //   "assets/images/flutter${index + 1}.png",
                //   fit: BoxFit.cover,
                // );
                return Image.network("${controller.bannerList[index].thumb}",
                    fit: BoxFit.cover);
                // return CacheImage.images(
                //     "${controller.bannerList[index].thumb}");
              },
              pagination: SwiperPagination(
                  margin: const EdgeInsets.all(0.0),
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            height: ScreenUtils.height(20)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: const RectSwiperPaginationBuilder(
                                activeColor: Colors.blue,
                              ).build(context, config),
                            ))
                          ],
                        ));
                  })),
              autoplay: false,
              duration: 2000,
            ),
          ),
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
                                      "${controller.videoList[index].thumb}", fit: BoxFit.cover),
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
                                              fontSize: ScreenUtils.fontSize(11),
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
                      onTap: (){
                        Get.toNamed("/video", arguments: {
                          "vid": controller.videoList[index].vid,
                        });
                      },
                    );
                  },
                ),
              )
            : Loading.progressIndicator()),
        Obx(() => controller.hasData.value && controller.videoList.isNotEmpty
            ? Loading.loading()
            : controller.videoList.isNotEmpty
                ? Loading.loadingText("---没有更多数据---")
                : const Text(""))
      ],
    );
  }
}
