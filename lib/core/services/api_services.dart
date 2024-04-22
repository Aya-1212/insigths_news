import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:insigths_news/core/constants/api_constant.dart';
import 'package:insigths_news/features/model/news_model/news_model.dart';
import 'package:insigths_news/features/model/source_model/source_model.dart';

class ApiServices {
  static Future<NewsModel?> getNewsByCategoryApi(String category) async {
    try {
      //https://newsapi.org/v2/top-headlines?country=us&apiKey=da6bdb1fa40944f0bf57db3aa9b45827
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?country=us&category=$category&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static Future<NewsModel?> getNewsByCategoryImageGeneralApi() async {
    try {
      //https://newsapi.org/v2/top-headlines?country=us&apiKey=da6bdb1fa40944f0bf57db3aa9b45827
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?category=general&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///search
  static Future<NewsModel?> getNewsBySearchApi(String query) async {
    try {
      //https://newsapi.org/v2/top-headlines?country=us&apiKey=da6bdb1fa40944f0bf57db3aa9b45827
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadLines}?q=$query&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///sources
  //https://newsapi.org/v2/top-headlines/sources?apiKey=da6bdb1fa40944f0bf57db3aa9b45827

  static Future <SourceModel?> getNewsBySourcesApi() async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.sourcesEndPoint}?apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if(res.statusCode == 200){
          SourceModel model = SourceModel.fromJson(json.decode(res.body));
          return model ;
      }
    } catch (e) {
      log(e.toString());
    }
    return null ;
  }


    static Future <NewsModel?> getAeticlesByChooseSourcesApi(String sourceId) async {
    try {
      var url = Uri.parse(
        //https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=da6bdb1fa40944f0bf57db3aa9b45827
          '${ApiConstants.baseUrl+ApiConstants.topHeadLines}?sources=$sourceId&apiKey=${ApiConstants.apiKey}');
      var res = await http.get(url);
      if(res.statusCode == 200){
          NewsModel model = NewsModel.fromJson(json.decode(res.body));
     // print(model.totalResults);
          return model ;
      }
    } catch (e) {
      log(e.toString());
    }
    return null ;
  }

}
