part of 'detail_bloc.dart';
/*
abstract class DetailScreenState {
  const DetailScreenState();
}
*/
class DetailScreenState extends Equatable {
  final List<DataModel> data;
  final bool isLoading;


  const DetailScreenState({
    required this.data,
    required this.isLoading,
  });

  DetailScreenState copyWith({
    List<DataModel>? data,
    bool? isLoading,

  }) {
    return DetailScreenState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading,];

}

