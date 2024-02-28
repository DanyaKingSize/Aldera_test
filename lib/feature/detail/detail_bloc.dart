
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../data_model.dart';
import '../../repository.dart';


part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailScreenEvent, DetailScreenState> {
  final Repository repository;
  DetailBloc(this.repository) : super(const DetailScreenState(isLoading: false, data: [])) {
    on<DetailEvent>((event, emit) {
      emit(state.copyWith(isLoading: true));
      //Закончить
    });
  }
}
