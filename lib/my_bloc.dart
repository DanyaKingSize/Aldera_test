import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:test_app/data_model.dart';

enum ContentType {
  image('image'),
  video('video'),
  audio('audio');

  final String value;

  const ContentType(this.value);
}

String buildUrl(String userRequest) {
  return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=image';
}

abstract class UserEvent {
  const UserEvent();
}

class SelectContentType extends UserEvent {
  final ContentType contentType;

  const SelectContentType(this.contentType);
}

class UserRequest extends UserEvent {
  final String request;

  UserRequest([this.request = '']);
}

class UserState extends Equatable {
  final List<DataModel> data;
  final bool isLoading;
  final ContentType currentContentType;

  UserState({
    required this.data,
    required this.isLoading,
    required this.currentContentType,
  });

  UserState copyWith({
    List<DataModel>? data,
    bool? isLoading,
    ContentType? currentContentType,
  }) {
    return UserState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      currentContentType: currentContentType ?? this.currentContentType,
    );
  }

  @override
  List<Object?> get props => [data, isLoading, currentContentType];
}

class MyBloc extends Bloc<UserEvent, UserState> {
  MyBloc()
      : super(UserState(
          data: const [],
          isLoading: false,
          currentContentType: ContentType.image,
        )) {
    on<UserRequest>((event, emit) async {
      emit(state.copyWith(isLoading: true));
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
        emit(state.copyWith(data: urls, isLoading: false));
      } else {
        print(response.statusCode);
      }
    });
    on<SelectContentType>((event, emit) {
      emit(
        state.copyWith(
          currentContentType: event.contentType,
        ),
      );
    });
  }
}
