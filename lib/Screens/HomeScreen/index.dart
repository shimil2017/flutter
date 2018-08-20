import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  HomeScreenState createState() => new HomeScreenState();
}

PageController pageController;

class HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  bool triedSilentLogin = false;
  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby app"),
        backgroundColor: Color.fromRGBO(162, 146, 199, 0.8),
      ),
      drawer: Drawer(),
      body: new PageView(
        children: [
          new Container(
            color: Colors.red,
          ),
          new Container(
            color: Colors.blue,
          ),
          new Container(
            color: Colors.green,
          ),
          new Container(
            color: Colors.white,
          ),
          new Container(
            color: Colors.yellow,
          )
        ],
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Colors.grey),
              title: new Container(),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: Colors.grey),
              title: new Container(),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add_circle, color: Colors.grey),
              title: new Container(),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.star, color: Colors.grey),
              title: new Container(),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person_outline, color: Colors.grey),
              title: new Container(),
              backgroundColor: Colors.white),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
