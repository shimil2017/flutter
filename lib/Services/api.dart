import '../model/babytimeline_model.dart';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';

class Api {
  static final HttpClient _httpclient = HttpClient();
  static final String _url = "api.github.com";
  static final String _url2 = "newsapi.org";
  static Future<List<BabyTimeline>> getRepositoriesWithSearchQuery(
      String query) async {
    final uri = Uri.http(_url, '/search/repositories', {
      'q': query,
      'sort': 'stars',
      'order': 'desc',
      'page': '0',
      'per_page': '25'
    });

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['erros'] != null) {
      return null;
    }

    return BabyTimeline.mapStringtoList(jsonResponse['items']);
  }

  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    //  print(uri);
    try {
      final httpRequest = await _httpclient.getUrl(uri);
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
