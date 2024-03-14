import 'package:flutter/cupertino.dart';

import 'api_request_service.dart';
import '../home/data_model.dart';
import '../feature/detail/bloc_request/my_bloc.dart';

String createMediaLink(String contentType, String nasaId) {
  if (contentType == 'audio') {// fixme enum + switch
    return 'http://images-assets.nasa.gov/$contentType/$nasaId/$nasaId~orig.mp3';// fixme base url to constant
  } else if (contentType == 'video') {
    return 'http://images-assets.nasa.gov/$contentType/$nasaId/$nasaId~orig.mp4';// fixme base url to constant
  } else if (contentType == 'image') {
    return '';
  } else {
    debugPrint(contentType);
    throw Exception('CreateMediaLink error type');
  }
}

class Repository {
  final RequestService _requestService;

  Repository(this._requestService);

  Future<List<DataModel>> getResponse({
    MyContentType contentType = MyContentType.image,
    required String userSearchQuery,
  }) async {
    final response = await _requestService.getResponse(
      userRequestQuery: userSearchQuery,
      contentType: contentType.value,
    );
    List<DataModel> urls = [];
    for (var item in response['collection']['items']) {
      urls.add(
        DataModel(
          title: item['data'][0]['title'],
          center: item['data'][0]['center'] ?? "",
          date: item['data'][0]['date_created'],
          id: item['data'][0]['nasa_id'],
          image: item['links'] != null ? item['links'][0]['href'] : '',
          keyWord: (item['data'][0]['keywords'] as List<dynamic>? ?? [])
              .cast<String>(),
          subTitle: item['data'][0]['description'] ?? '',
          type: item['data'][0]['media_type'],
          mediaLink: createMediaLink(
              item['data'][0]['media_type'], item['data'][0]['nasa_id']),
        ),
      );
    }
    return urls;
  }
}
