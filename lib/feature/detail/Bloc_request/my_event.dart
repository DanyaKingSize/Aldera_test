part of 'my_bloc.dart';

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