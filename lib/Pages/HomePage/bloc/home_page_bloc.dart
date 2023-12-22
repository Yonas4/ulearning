import 'dart:async';

import 'package:bloc/bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDotsEvent>(_homePageDots);
  }

  FutureOr<void> _homePageDots(
      HomePageDotsEvent event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
