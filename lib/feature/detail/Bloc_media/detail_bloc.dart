import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailScreenEvent, DetailState> {
  DetailBloc() : super(IdleDetailState()) {
    on<GetMediaDetailEvent>((event, emit) {
      emit(LoadingDetailState());
      emit(SuccessMediaDetailState(
        contentType: event.contentType,
      ));
    });
  }
}
