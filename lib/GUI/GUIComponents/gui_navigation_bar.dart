import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'package:vn_rust_hackathon/GUI/GUIHistory/gui_history.dart';

import 'package:vn_rust_hackathon/GUI/gui_dashboard.dart';

class CustomIcons {
  static const _kFontFam = 'CustomIcons';
  static const IconData yourCustomIcon =
      IconData(0xe800, fontFamily: _kFontFam);
}

class GUINavigationBar extends StatefulWidget {
  static final GUINavigationBar _bar = GUINavigationBar._internal();
  factory GUINavigationBar(int i) {
    _bar.currentTab = i;
    return _bar;
  }
  GUINavigationBar._internal() {
    iconList = [];
  }
  late List<IconData> iconList;
  late int currentTab = 2;
  @override
  State<StatefulWidget> createState() => NavigationBarState();
}

class NavigationBarState extends State<GUINavigationBar>
    with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController =
        MotionTabBarController(initialIndex: 2, length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }

  NavigationBarState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        tabSelectedColor: Colors.black,

        tabIconColor: Colors.black,
        tabBarColor: Colors.white70,
        tabIconSelectedColor: Colors.amber,
        controller: _motionTabBarController,
        initialSelectedTab: 'Dashboard',
        textStyle: TextStyle(color: Colors.transparent),
        labels: ["Account", "Performance", "Dashboard", "Trade", "History"],
        icons: [
          Icons.account_box,
          Icons.scale,
          Icons.dashboard,
          Icons.arrow_circle_left_rounded,
          Icons.history
        ],

        // badges: [
        //   // Default Motion Badge Widget
        //   const MotionBadgeWidget(
        //     text: '10+',
        //     textColor: Colors.white, // optional, default to Colors.white
        //     color: Colors.red, // optional, default to Colors.red
        //     size: 18, // optional, default to 18
        //   ),
        //
        //   // custom badge Widget
        //   Container(
        //     color: Colors.black,
        //     padding: const EdgeInsets.all(2),
        //     child: const Text(
        //       '11',
        //       style: TextStyle(
        //         fontSize: 14,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        //
        //   // allow null
        //   null,
        //   null,
        //
        //   // Default Motion Badge Widget with indicator only
        //   const MotionBadgeWidget(
        //     isIndicator: true,
        //     color: Colors.blue, // optional, default to Colors.red
        //     size: 5, // optional, default to 5,
        //     show: true, // true / false
        //   ),
        // ],
        onTabItemSelected: (int value) {
          setState(() {
            // _tabController!.index = value;
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
        children: <Widget>[
          MainPageContentComponent(
              title: "Home Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "Profile Page", controller: _motionTabBarController!),
          GUIDashboard(
              title: "Dashboard Page", controller: _motionTabBarController!),
          MainPageContentComponent(
              title: "Settings Page", controller: _motionTabBarController!),
          GUIHistory(
            motionTabBarController: _motionTabBarController!,
          ),
        ],
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker((elapsed) {});
  }
}

class MainPageContentComponent extends StatelessWidget {
  const MainPageContentComponent({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final MotionTabBarController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          const Text('Go to "X" page programmatically'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => controller.index = 0,
            child: const Text('Dashboard Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 1,
            child: const Text('Home Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 2,
            child: const Text('Profile Page'),
          ),
          ElevatedButton(
            onPressed: () => controller.index = 3,
            child: const Text('Settings Page'),
          ),
        ],
      ),
    );
  }
}
