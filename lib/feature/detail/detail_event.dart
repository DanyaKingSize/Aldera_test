part of 'detail_bloc.dart';

abstract class DetailScreenEvent {
  const DetailScreenEvent();
}

class GetMediaDetailEvent extends DetailScreenEvent {
  final String contentType;
  GetMediaDetailEvent({required this.contentType});
}

