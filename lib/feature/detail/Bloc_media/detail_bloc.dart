import 'package:bloc/bloc.dart';

import '../../../repository/repository.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailScreenEvent, DetailState> {
  final Repository _repository;

  DetailBloc(
    this._repository,
  ) : super(IdleDetailState()) {
    on<GetMediaDetailEvent>((event, emit) {
      emit(LoadingDetailState());
      emit(SuccessMediaDetailState(
        contentType: event.contentType,
      ));
    });
  }
}
