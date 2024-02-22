import 'package:dio/dio.dart';
import 'data_model.dart';


class Repository {

  String buildUrl(String userRequest) {
    return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=image';
  }

  Future<List<DataModel>> getResponse(String userRequest) async {
    var response = await Dio().get(buildUrl(userRequest));
    if (response.statusCode == 200) {
      List<DataModel> urls = [];
      for (var item in response.data['collection']['items']) {
        urls.add(
          DataModel(
            title: item['data'][0]['title'],
            center: item['data'][0]['center'] ?? "",
            date: item['data'][0]['date_created'],
            id: item['data'][0]['nasa_id'],
            image: item['links'][0]['href'],
            keyWord: (item['data'][0]['keywords'] as List<dynamic>? ?? [])
                .cast<String>(),
            subTitle: item['data'][0]['description'],
            type: item['data'][0]['media_type'],
          ),
        );
      }
      return urls;
    }
    return [];
  }
}


/*
var response = await Dio().get(buildUrl(event.request));
if (response.statusCode == 200) {
List<DataModel> urls = [];
for (var item in response.data['collection']['items']) {
urls.add(
DataModel(
title: item['data'][0]['title'],
center: item['data'][0]['center'] ?? "",
date: item['data'][0]['date_created'],
id: item['data'][0]['nasa_id'],
image: item['links'][0]['href'],
keyWord: (item['data'][0]['keywords'] as List<dynamic>? ?? [])
    .cast<String>(),
subTitle: item['data'][0]['description'],
type: item['data'][0]['media_type'],
),
);
}

 */