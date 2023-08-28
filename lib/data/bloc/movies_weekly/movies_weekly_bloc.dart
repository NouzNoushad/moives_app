import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import '../../../utils/constant.dart';

part 'movies_weekly_event.dart';
part 'movies_weekly_state.dart';

class MoviesWeeklyBloc extends Bloc<MoviesWeeklyEvent, MoviesWeeklyState> {
  final MoviesRepository moviesRepository;
  MoviesWeeklyBloc({required this.moviesRepository})
      : super(MoviesWeeklyInitial()) {
    on<TrendingMoviesWeeklyEvent>(trendingMoviesWeekly);
  }
  FutureOr<void> trendingMoviesWeekly(
      TrendingMoviesWeeklyEvent event, Emitter<MoviesWeeklyState> emit) async {
    emit(MoviesWeeklyLoadingState());
    try {
      List<dynamic> trendingMoviesWeekly =
          await moviesRepository.fetchMovies(date: weekly, type: moviesType, mediaType: MediaType.movie);
      emit(TrendingMoviesWeeklyState(trendingMoviesWeekly));
    } catch (error) {
      emit(MoviesWeeklyErrorState(error.toString()));
    }
  }
}
