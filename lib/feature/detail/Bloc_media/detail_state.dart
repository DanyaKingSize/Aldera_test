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

class SuccessMediaDetailState extends DetailState {
  final String contentType;

  SuccessMediaDetailState({required this.contentType});
}
