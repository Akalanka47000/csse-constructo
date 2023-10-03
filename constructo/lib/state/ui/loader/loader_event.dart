part of 'loader_bloc.dart';

abstract class LoaderEvent {
  const LoaderEvent();
}

class SetLoading extends LoaderEvent {
  final bool loading;
  const SetLoading(this.loading);
}