import '../model/babytimeline_model.dart';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';

class Api {
  static final HttpClient _httpclient = HttpClient();
  static final String _url = "www.spearheadcontent.com";
  //static final String _url2 = "newsapi.org";
  static Future<List<BabyTimeline>> getBabytimeline() async {
    final uri =
        Uri.https(_url, '/timelines/baby/5af19e13b46260277593765e/1', null);
    // print(uri);

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['erros'] != null) {
      return null;
    }
    //print(jsonResponse['data']['data']);
    return BabyTimeline.mapStringtoList(jsonResponse['data']['data']);
  }

  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    //  print(uri);
    try {
      final httpRequest = await _httpclient.getUrl(uri);
      httpRequest.headers.set("token",
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RtZUBnbWFpbC5jb20iLCJleHAiOjE1MzczNDA5MDAsImlhdCI6MTUzNDc0ODkwMH0.YF8khXglUazprpj35WqtVnLOrv-nOgvAeeO7CswJ0PI");
      httpRequest.headers.set("id", "5af19df1b462602775937659");
      httpRequest.headers.set("Content-type", "application/json");
      //  print(httpRequest.headers);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }
      final responsebody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responsebody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
