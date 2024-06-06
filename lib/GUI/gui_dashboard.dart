import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:vn_rust_hackathon/Business/business_dashboard.dart';

class GUIDashboard extends StatefulWidget {
  const GUIDashboard({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<GUIDashboard> createState() => _GUIDashboardState();
}

class _GUIDashboardState extends State<GUIDashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.blue,
        // width: 200,
        // height: 300,
        child: ContainedTabBarView(
          tabs: List.generate(
            BusinessDashboard.GetNumberTab(),
            (index) => Text(
              BusinessDashboard.GetHeader(index),
            ),
          ),
          views: [
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.green),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
