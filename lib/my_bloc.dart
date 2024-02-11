import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:test_app/data_model.dart';

String buildUrl(String userRequest) {
  return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=image';
}

abstract class UserEvent {}

class UserRequest extends UserEvent {
  final String request;

  UserRequest([this.request = '']);
}

abstract class UserState {}

class Loading extends UserState {}

class Idle extends UserState {}

class Success extends UserState {
  final List<DataModel> data;

  Success(this.data);
}

class MyBloc extends Bloc<UserEvent, UserState> {
  MyBloc() : super(Idle()) {
    on<UserRequest>((event, emit) async {
      emit(Loading());
      var response = await Dio().get(buildUrl(event.request));
      if (response.statusCode == 200) {
        List<DataModel> urls = [];
        for (var item in response.data['collection']['items']) {
          urls.add(
            DataModel(
              title: item['data'][0]['title'],
              center: item['data'][0]['center'],
              date: item['data'][0]['date_created'],
              id: item['data'][0]['nasa_id'],
              image: item['links'][0]['href'],
              keyWord: (item['data'][0]['keywords'] as List<dynamic>? ?? [])
                  .cast<String>(),
              subTitle: item['data'][0]['description'],
            ),
          );
        }
        emit(Success(urls));
      } else {
        print(response.statusCode);
      }
    });
  }
}
