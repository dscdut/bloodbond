import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.event.dart';
part 'search.state.dart';
part 'search.bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
