import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data_model.dart';
import 'repository.dart';


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
  final String userSearchQuery;



  const UserState({
    required this.data,
    required this.isLoading,
    required this.currentContentType,
    required this.userSearchQuery


  });

  UserState copyWith({
    List<DataModel>? data,
    bool? isLoading,
    MyContentType? currentContentType,
    String? userSearchQuery,
  }) {
    return UserState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      currentContentType: currentContentType ?? this.currentContentType,
      userSearchQuery: userSearchQuery ?? this.userSearchQuery

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
          userSearchQuery: '',
        )) {
    on<UserRequest>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      String request = '';
      if (event.request == '') {
        request = state.userSearchQuery;
      }else{
          request = event.request;
      }

      var response = await repository.getResponse(
        userSearchQuery: request,
        contentType: state.currentContentType,
      );
      emit(state.copyWith(data: response, isLoading: false,userSearchQuery: event.request ));
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
