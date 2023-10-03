part of 'loader_bloc.dart';

class LoaderState extends Equatable {
  final bool loading;

  const LoaderState({this.loading = true});

  LoaderState copyWith({bool? loading, bool? opaque}) => LoaderState(
        loading: loading ?? this.loading,
      );

  @override
  List<Object> get props => [loading];
}
