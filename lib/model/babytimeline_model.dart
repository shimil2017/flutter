class BabyTimeline {
  String age;
  String name;
  String location;
  List fileapth;
  String text;
  String created_date;
  List likes;
  List comments;
  List tag;
  String posttype;
  int privacy;
  String relation;

  BabyTimeline(
      this.age,
      this.name,
      this.location,
      this.fileapth,
      this.text,
      this.created_date,
      this.likes,
      this.comments,
      this.tag,
      this.posttype,
      this.privacy,
      this.relation);

  // NewsItem(this.description, this.title, this.url, this.urlToImage);
  static List<BabyTimeline> mapStringtoList(List<dynamic> jsonList) {
    // print(jsonList);
    return jsonList
        .map((r) => BabyTimeline(
            r['age'],
            r['name'],
            r['location'],
            r['fileapth'],
            r['text'],
            r['created_date'],
            r['likes'],
            r['comments'],
            r['tag'],
            r['posttype'],
            r['privacy'],
            r['relation']))
        .toList();
  }
}
