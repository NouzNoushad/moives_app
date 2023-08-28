import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import '../../../utils/constant.dart';

part 'movies_daily_event.dart';
part 'movies_daily_state.dart';

class MoviesDailyBloc extends Bloc<MoviesDailyEvent, MoviesDailyState> {
  final MoviesRepository moviesRepository;
  MoviesDailyBloc({required this.moviesRepository})
      : super(MoviesDailyInitial()) {
    on<TrendingMoviesDailyEvent>(trendingDailyWeekly);
  }

  FutureOr<void> trendingDailyWeekly(
      TrendingMoviesDailyEvent event, Emitter<MoviesDailyState> emit) async {
    emit(MoviesDailyLoadingState());
    try {
      List<dynamic> trendingMoviesWeekly = await moviesRepository.fetchMovies(
          date: daily, type: moviesType, mediaType: MediaType.movie);
      emit(TrendingMoviesDailyState(trendingMoviesWeekly));
    } catch (error) {
      emit(MoviesDailyErrorState(error.toString()));
    }
  }
}
