import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/gui_history_item.dart';
import 'package:vn_rust_hackathon/GUI/GUIHistory/gui_history_notifier.dart';

import '../../DTO/dto_history.dart';
import '../GUIComponents/gui_notification.dart';

class GUIHistory extends StatefulWidget {
  const GUIHistory({
    super.key,
    required this.motionTabBarController,
  });
  final MotionTabBarController motionTabBarController;

  @override
  State<StatefulWidget> createState() => GUIHistoryState();
}

class GUIHistoryState extends State<GUIHistory> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // User is scrolling down
      if (!_showFab) {
        setState(() {
          _showFab = true;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // User is scrolling up
      if (_showFab) {
        setState(() {
          _showFab = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    HistoryModel _model = Provider.of<HistoryModel>(context);
    _model.fetchHistoryData();
    return Scaffold(
        backgroundColor: Colors.black,
        // floatingActionButtonLocation: FloatingActionButtonLocation.,
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                backgroundColor: CupertinoColors.darkBackgroundGray,
                foregroundColor: Colors.lightBlue,
                child: Icon(Icons.arrow_upward),
              )
            : null,
        body: Consumer<HistoryModel>(
          builder: (context, _model, child) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: _model.items.length,
              itemBuilder: (context, index) {
                return _model.items[_model.items.length - index - 1];
              },
            );
          },
        ));
  }
}
