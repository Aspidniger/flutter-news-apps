
import 'package:flutter/material.dart';
import 'package:flutter_news_apps/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'b50fe9a8eb5d4a43a63f2a4186e314c3';



class NewsServices2 with ChangeNotifier{

  List<Article> headlines = [];

  NewsServices2() {
    getTopHeadlines();
  }
  
  Future<void> getTopHeadlines() async {
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&category=health&apiKey=$_APIKEY');
    try {
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final newResponse = reqResListadoFromJson(resp.body);
        headlines.addAll(newResponse.articles);
        notifyListeners();
      } else {
        debugPrint('Error al cargar las noticias ${resp.statusCode}');
      }

    } catch (e) {
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }
}