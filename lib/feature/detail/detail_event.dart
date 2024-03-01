part of 'detail_bloc.dart';

abstract class DetailScreenEvent {
  const DetailScreenEvent();
}

class GetLinkDetailEvent extends DetailScreenEvent {
  final String nasaId;
  GetLinkDetailEvent(this.nasaId);

}

class GetLinkAudioDetailEvent extends DetailScreenEvent {
  GetLinkAudioDetailEvent();
}