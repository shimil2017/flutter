import 'package:flutter/material.dart';
import 'dart:async';
import '../../Services/api.dart';
import '../../model/babytimeline_model.dart';
import './post.dart';
import '../../Components/babystories.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key key}) : super(key: key);
  @override
  TimelineScreenState createState() => new TimelineScreenState();
}

PageController pageController;

class TimelineScreenState extends State<TimelineScreen> {
  List<BabyTimeline> _timeline = List();
  bool _isFetching = false;
  String _error;

  void loadingTrendRepose() async {
    setState(() {
      _error = null;
      _isFetching = true;
    });
    final timeline = await Api.getBabytimeline();
    print(timeline);
    // final repos = await Api.getTrendingRepositories();
    //print(repos);
    setState(() {
      _isFetching = false;
      if (timeline != null) {
        this._timeline = timeline;
      } else {
        _error = 'Error fetching repos';
      }
      _error = null;
    });
  }

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
    loadingTrendRepose();
    _scrollController.addListener(() {
      //print("huuuu");
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
        margin: EdgeInsets.only(top: 4.0), child: newbody(context));
  }

  Widget newbody(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    if (_isFetching) {
      return Container(
        alignment: Alignment.center,
        child: Icon(Icons.timelapse),
      );
    } else if (_error != null) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          _error,
          style: Theme.of(context).textTheme.headline,
        ),
      );
    } else {
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _timeline.length,
          itemBuilder: (context, index) => index == 0
              ? new SizedBox(
                  child: new BabyStories(),
                  height: deviceSize.height * 0.15,
                )
              : Post(_timeline[index]));
    }
  }
}
