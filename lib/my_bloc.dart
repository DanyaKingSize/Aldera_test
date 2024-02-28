import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data_model.dart';
import 'repository.dart';
import 'data_model.dart';

enum MyContentType {
  image('image'),
  video('video'),
  audio('audio');

  final String value;

  const MyContentType(this.value);
}

String buildUrl(String userRequest) {
  return 'https://images-api.nasa.gov/search?q=$userRequest&media_type=image';
}

abstract class UserEvent {
  const UserEvent();
}

class SelectContentType extends UserEvent {
  final MyContentType contentType;

  const SelectContentType(this.contentType);
}

class UserRequest extends UserEvent {
  final String request;

  UserRequest([this.request = '']);
}

class UserState extends Equatable {
  final List<DataModel> data;
  final bool isLoading;
  final MyContentType currentContentType;

  const UserState({
    required this.data,
    required this.isLoading,
    required this.currentContentType,
  });

  UserState copyWith({
    List<DataModel>? data,
    bool? isLoading,
    MyContentType? currentContentType,
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
  final Repository repository;

  MyBloc(this.repository)
      : super(const UserState(
          data: [],
          isLoading: false,
          currentContentType: MyContentType.image,
        )) {
    on<UserRequest>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      var response = await repository.getResponse(
        userSearchQuery: event.request,
        contentType: state.currentContentType,
      );
      emit(state.copyWith(data: response, isLoading: false));
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

// class VideoBloc extends Bloc<UserEvent, UserState> {
//
// }