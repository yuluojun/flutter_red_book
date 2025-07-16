import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/service/screenUtils.dart';

import '../controllers/searchs_controller.dart';

class SearchsView extends GetView<SearchsController> {
  const SearchsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            IconFonts.fanhui1,
            color: Colors.white,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: ScreenUtils.height(36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            cursorColor: Colors.blue,
            //手势的颜色
            autofocus: false,
            style: const TextStyle(
                textBaseline: TextBaseline.alphabetic, color: Colors.black54),
            decoration: InputDecoration(
//配置padding值
                contentPadding: EdgeInsets.all(0),
                prefixIcon: const Icon(IconFonts.sousuo,
                    color: Colors.black26, size: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none)),
            onChanged: (value) {},
          ),
        ),
        centerTitle: true,
        titleSpacing: 0,
        //清除返回键间距
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "搜索",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtils.fontSize(18)),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _search(),
    );
  }

  Widget _search() {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtils.width(10), left: ScreenUtils.width(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("历史记录",
                  style: TextStyle(
// fontWeight: FontWeight.bold,
                      fontSize: ScreenUtils.fontSize(20))),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: ScreenUtils.width(30)),
                  child: Icon(
                    IconFonts.shanchu,
                    color: Colors.black45,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtils.width(16), top: ScreenUtils.width(10)),
              child: Container(
                // alignment:Alignment.topLeft,
                color: Colors.white,
                // padding: EdgeInsets.fromLTRB(
                //     ScreenUtils.width(36),
                //     ScreenUtils.width(16),
                //     ScreenUtils.width(36),
                //     ScreenUtils.width(20)),
                margin: EdgeInsets.only(
                    left: ScreenUtils.width(10),
                    right: ScreenUtils.width(10),
                    bottom: ScreenUtils.width(10)),
                child: Text("男装",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtils.fontSize(16))),
              ),
            ),

          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtils.width(10),
                        left: ScreenUtils.width(16),
                        bottom: ScreenUtils.width(16)),
                    child: Text(
                      "搜索发现",
                      style: TextStyle(fontSize: ScreenUtils.fontSize(20)),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    left: ScreenUtils.width(20),
                    right: ScreenUtils.width(16),
                    bottom: ScreenUtils.width(16)),
                child: GridView.builder(
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    //收缩
                    itemCount: 10,
                    //必须设置
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: ScreenUtils.width(20),
                        mainAxisSpacing: ScreenUtils.height(10),
                        childAspectRatio: 2 / 1),
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenUtils.width(60),
                            // padding: EdgeInsets.only(
                            //     left: ScreenUtils.width(10),
                            //     right: ScreenUtils.width(10),
                            //     bottom: ScreenUtils.width(40)),
                            child: InkWell(
                              onTap: () {},
                              child: Image.network(
                                "https://img.flutterschool.cn/202404/013b60b5b3fd101.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // padding: EdgeInsets.only(
                              //     left: ScreenUtils.width(10),
                              //     right: ScreenUtils.width(10),
                              //     bottom: ScreenUtils.width(10)),
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "大学大学",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(height: 1.4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
