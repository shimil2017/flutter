import 'package:flutter/material.dart';
import 'dart:async';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key key}) : super(key: key);
  @override
  TimelineScreenState createState() => new TimelineScreenState();
}

PageController pageController;

class TimelineScreenState extends State<TimelineScreen> {
  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  List<int> items = List.generate(10, (i) => i);
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<int> newEntries = await fakeRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: new Text("Number $index"));
        },
        controller: _scrollController,
      ),
    );
  }
}
