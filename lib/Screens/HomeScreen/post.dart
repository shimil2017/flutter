import 'package:flutter/material.dart';
import '../../model/babytimeline_model.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Components/babystories.dart';
import 'package:timeago/timeago.dart' as timeago;

class Post extends StatelessWidget {
  final BabyTimeline timeline;
  Post(this.timeline);

  @override
  Widget build(BuildContext context) {
    print(timeline.created_date);
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                    ),
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: <Widget>[
                      new Text(
                        "dummy text",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        timeline.relation != null
                            ? timeline.relation
                            : 'np relation',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              new IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: null,
              )
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: new Image.network(
            "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Icon(
                    Icons.bubble_chart,
                  ),
                  new SizedBox(
                    width: 16.0,
                  ),
                  new Icon(Icons.comment),
                  new SizedBox(
                    width: 16.0,
                  ),
                  new Icon(Icons.share),
                ],
              ),
              new Icon(Icons.label)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Liked by pawankumar, pk and 528,331 others",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: new TextField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add a comment...",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('1 day GO', style: TextStyle(color: Colors.grey)),
        )
      ],
    );
  }
}
