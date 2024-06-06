import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';
import 'package:vn_rust_hackathon/Business/business_dashboard.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/GUIDashboard/gui_dashboard_notifier.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/GUIDashboard/gui_record.dart';

class GUIDashboard extends StatefulWidget {
  const GUIDashboard({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  static const String routeName = '/dashboard';
  final String title;
  final MotionTabBarController controller;
  @override
  State<GUIDashboard> createState() => _GUIDashboardState();
}

class _GUIDashboardState extends State<GUIDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late InfiniteScrollController _controllerTabAll;
  late InfiniteScrollController _controllerTabHot;
  late InfiniteScrollController _controllerTabNew;

  int selectedTabAll = 0;
  int selectedTabHot = 0;
  int selectedTabNew = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    _controllerTabAll = InfiniteScrollController();
    _controllerTabHot = InfiniteScrollController();
    _controllerTabNew = InfiniteScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controllerTabAll.dispose();
    _controllerTabHot.dispose();
    _controllerTabNew.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AllCoinModel allModel = Provider.of<AllCoinModel>(context);
    HotCoinModel hotModel = Provider.of<HotCoinModel>(context);
    NewCoinModel newModel = Provider.of<NewCoinModel>(context);
    allModel.fetchAllData();
    hotModel.fetchHotData();
    newModel.fetchNewData();
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: TabContainer(
            controller: _tabController,
            tabEdge: TabEdge.top,
            tabsStart: 0.1,
            // tabsEnd: 0.9,
            tabMaxLength: 100,
            borderRadius: BorderRadius.circular(10),
            tabBorderRadius: BorderRadius.circular(10),
            childPadding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
            selectedTextStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            unselectedTextStyle: const TextStyle(
              color: Color.fromARGB(150, 200, 200, 200),
              fontSize: 13.0,
            ),
            colors: [
              Color.fromARGB(40, 135, 135, 231),
              Color.fromARGB(40, 231, 135, 135),
              Color.fromARGB(40, 135, 231, 135),
            ],
            tabs: [
              Text(BSDashboard.GetHeader(0)),
              Text(BSDashboard.GetHeader(1)),
              Text(BSDashboard.GetHeader(2)),
            ],
            children: [
              // All
              Consumer<AllCoinModel>(builder: (context, allModel, child) {
                return ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  itemCount: BSDashboard.GetNumberRecord(0),
                  itemBuilder: (BuildContext context, int index) {
                    return GUIDashboardRecord(
                      index: index,
                      tab: 0,
                    );
                  },
                );
              }),

              // Hot
              Consumer<HotCoinModel>(builder: (context, hotModel, child) {
                return ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  itemCount: BSDashboard.GetNumberRecord(1),
                  itemBuilder: (BuildContext context, int index) {
                    return GUIDashboardRecord(
                      index: index,
                      tab: 1,
                    );
                  },
                );
              }),
              // New
              Consumer<NewCoinModel>(builder: (context, newModel, child) {
                return ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  itemCount: BSDashboard.GetNumberRecord(2),
                  itemBuilder: (BuildContext context, int index) {
                    return GUIDashboardRecord(
                      index: index,
                      tab: 2,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
