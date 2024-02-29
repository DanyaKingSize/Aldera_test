part of 'detail_bloc.dart';

abstract class DetailState {
  const DetailState();
}

class IdleDetailState extends DetailState {
  IdleDetailState();
}

class LoadingDetailState extends DetailState {
  LoadingDetailState();
}

class SuccessDetailState extends DetailState {
  final String sourceLink;

  SuccessDetailState(this.sourceLink);
}

