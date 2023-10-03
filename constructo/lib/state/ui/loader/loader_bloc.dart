import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(const LoaderState()) {
    on<SetLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });
  }
}
