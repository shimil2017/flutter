import 'package:flutter/material.dart';
import '../Login/index.dart';
import './Timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  HomeScreenState createState() => new HomeScreenState();
}

PageController pageController;

class HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  bool triedSilentLogin = false;
  int _currentIndex = 0;
  final List<Widget> _children = [
    TimelineScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.black,
    ),
  ];
  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
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
      drawer: new Drawer(
          child: Container(
              color: Color.fromRGBO(247, 64, 106, 1.0),
              child: new my_drawer(
                  email: "Devefy@gmail.com", name: "Abdi hamid"))),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.public),
            title: new Text('Community'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.timeline),
            title: new Text('Timeline'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}

class my_drawer extends StatelessWidget {
  String email, name;

  my_drawer({this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountEmail: new Text(email),
          accountName: new Text(name),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage("assets/profile_2.jpg"),
          ),
          decoration: new BoxDecoration(
            color: Color.fromRGBO(247, 64, 106, 1.0),
          ),
        ),
        new ListTile(
          title: new Text(
            "Add baby",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: new Icon(Icons.home),
          onTap: () {
            print("Home");
          },
        ),
        new ListTile(
          title: new Text(
            "Invite and Earn",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: new Icon(Icons.email),
          onTap: () {
            print("Notification");
          },
        ),
        new ListTile(
          title: new Text(
            "Family member",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: new Icon(Icons.child_friendly),
          onTap: () {
            print("Notification");
          },
        ),
        new ListTile(
          title: new Text(
            "Feedback",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: new Icon(Icons.label),
          onTap: () {
            print("Notification");
          },
        ),
        new ListTile(
          title: new Text("Logout",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          leading: new Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        )
      ],
    ));
  }
}
