part of 'my_bloc.dart';

class UserState extends Equatable {
  final List<DataModel> data;
  final bool isLoading;
  final MyContentType currentContentType;
  final String userSearchQuery;

  const UserState(
      {required this.data,
      required this.isLoading,
      required this.currentContentType,
      required this.userSearchQuery});

  UserState copyWith({
    List<DataModel>? data,
    bool? isLoading,
    MyContentType? currentContentType,
    String? userSearchQuery,
  }) {
    return UserState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        currentContentType: currentContentType ?? this.currentContentType,
        userSearchQuery: userSearchQuery ?? this.userSearchQuery);
  }

  @override
  List<Object?> get props => [data, isLoading, currentContentType];
}
