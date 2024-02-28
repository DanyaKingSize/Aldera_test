import 'package:bloc/bloc.dart';

import '../../data_model.dart';
import '../../repository.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailScreenEvent, DetailState> {
  final Repository _repository;

  DetailBloc(this._repository,) : super(IdleDetailState()) {
    on<GetLinkDetailEvent>((event,emit)async{
      emit(LoadingDetailState());
     String mediaLink = await _repository.getVideoLink(nasaId: event.data.id);
     emit(SuccessDetailState(mediaLink));
    }
    );
  }
}
