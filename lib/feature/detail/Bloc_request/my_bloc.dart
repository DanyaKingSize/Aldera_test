import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/home/data_model.dart';
import '../../../repository/repository.dart';

part 'my_event.dart';

part 'my_state.dart';

enum MyContentType {
  image('image'),
  video('video'),
  audio('audio');

  final String value;

  const MyContentType(this.value);
}

class MyBloc extends Bloc<UserEvent, UserState> {
  final Repository repository;

  MyBloc(this.repository)
      : super(
          const UserState(
            data: [],
            isLoading: false,
            currentContentType: MyContentType.image,
            userSearchQuery: '',
          ),
        ) {
    //fixme comma+
    on<UserRequest>(
      (event, emit) async {
        //fixme move to sepatated function
        emit(state.copyWith(isLoading: true));
        String request = '';
        if (event.request == '') {
          request = state.userSearchQuery;
        } else {
          request = event
              .request; //fixme move in base variable init (request = event.query -> if(request.isEmpty...)
        }

        var response = await repository.getResponse(
          userSearchQuery: request,
          contentType: state.currentContentType,
        );
        emit(
          state.copyWith(
              data: response, isLoading: false, userSearchQuery: event.request),
        ); //fixme comma
      },
    );
    on<SelectContentType>((event, emit) {
      emit(
        state.copyWith(
          currentContentType: event.contentType,
        ),
      );
    });
  }
}
