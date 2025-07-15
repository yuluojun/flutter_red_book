import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:study/app/modules/tabbar/basketball/views/basketball_view.dart';
import 'package:study/app/modules/tabbar/feel/views/feel_view.dart';
import 'package:study/app/modules/tabbar/funny/views/funny_view.dart';
import 'package:study/app/modules/tabbar/home/views/home_view.dart';
import 'package:study/app/modules/tabbar/school/views/school_view.dart';

class TabBars extends StatefulWidget {
  const TabBars({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabs = ["推荐", "校园", "篮球风云", "情感", "搞笑", "科技数码"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96),
        child: Stack(
          children: [_appBar(), _tabBar()],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeView(),
          SchoolView(),
          BasketballView(),
          FeelView(),
          FunnyView(),
          Text("科技数码"),
        ],
      ),
    );
  }

  _appBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.search, color: Colors.black12),
              const SizedBox(width: 10),
              Text("搜索", style: TextStyle(fontSize: 14, color: Colors.black12))
            ],
          ),
        ),
      ),
    );
  }

  _tabBar() {
    return Positioned(
      top: 88,
      left: 0,
      right: 0,
      child: Wrap(
        children: [
          Container(
            height: ScreenUtil().setHeight(36),
            padding: EdgeInsets.only(
                left: ScreenUtils.width(16), right: ScreenUtils.width(16)),
            decoration: BoxDecoration(color: Colors.blue),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              labelStyle: TextStyle(fontSize: ScreenUtils.fontSize(16), fontWeight: FontWeight.bold),
              tabs: tabs.map((value) {
                return Tab(child: Text(value));
              }).toList(),
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 0.1,
              indicatorPadding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.white,
              labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              unselectedLabelColor: Colors.white70,
              unselectedLabelStyle:
                  TextStyle(fontSize: ScreenUtils.fontSize(16)),
            ),
          )
        ],
      ),
    );
  }
}
