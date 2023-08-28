import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import '../../../utils/constant.dart';

part 'tv_series_weekly_event.dart';
part 'tv_series_weekly_state.dart';

class TvSeriesWeeklyBloc
    extends Bloc<TvSeriesWeeklyEvent, TvSeriesWeeklyState> {
  final MoviesRepository moviesRepository;
  TvSeriesWeeklyBloc({required this.moviesRepository})
      : super(TvSeriesWeeklyInitial()) {
    on<TrendingTvSeriesWeeklyEvent>(trendingTvSeriesWeekly);
  }

  FutureOr<void> trendingTvSeriesWeekly(TrendingTvSeriesWeeklyEvent event,
      Emitter<TvSeriesWeeklyState> emit) async {
    emit(TvSeriesWeeklyLoadingState());
    try {
      List<dynamic> trendingMoviesWeekly = await moviesRepository.fetchMovies(
          date: weekly, type: tvSeriesType, mediaType: MediaType.tvSeries);
      emit(TrendingTvSeriesWeeklyState(trendingMoviesWeekly));
    } catch (error) {
      emit(TvSeriesWeeklyErrorState(error.toString()));
    }
  }
}
