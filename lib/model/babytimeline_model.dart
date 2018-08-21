class BabyTimeline {
  String age;
  String name;
  String location;
  List fileapth;
  String text;
  DateTime createdDate;
  List likes;
  List comments;
  List tag;
  String posttype;
  int privacy;
  BabyTimeline(
      this.age,
      this.name,
      this.location,
      this.fileapth,
      this.text,
      this.createdDate,
      this.likes,
      this.comments,
      this.tag,
      this.posttype,
      this.privacy);

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
            r['createdDate'],
            r['likes'],
            r['comments'],
            r['tag'],
            r['posttype'],
            r['privacy']))
        .toList();
  }
}
