import 'api_request_service.dart';
import 'data_model.dart';
import 'my_bloc.dart';

class Repository {
  final RequestService _requestService;

  Repository(this._requestService);

  Future<String> getVideoLink({
    required String nasaId,
  }) async {
    final videoLink = await _requestService.getVideoLink(nasaId: nasaId);
    String  currentLink = videoLink['collection']['items'][0]['href'];
    return currentLink;
  }

  Future<String> getAudioLink({
    required String userSearchQuery
  }) async {
    final response = await _requestService.getResponse(userRequestQuery: userSearchQuery, contentType: 'audio');
    String  currentLink = response['collection']['items']['href'][0];
    return currentLink;
  }

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
}
