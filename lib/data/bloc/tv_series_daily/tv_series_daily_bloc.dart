import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import '../../../utils/constant.dart';

part 'tv_series_daily_event.dart';
part 'tv_series_daily_state.dart';

class TvSeriesDailyBloc extends Bloc<TvSeriesDailyEvent, TvSeriesDailyState> {
  final MoviesRepository moviesRepository;
  TvSeriesDailyBloc({required this.moviesRepository})
      : super(TvSeriesDailyInitial()) {
    on<TrendingTvSeriesDailyEvent>(trendingTvSeriesDaily);
  }

  FutureOr<void> trendingTvSeriesDaily(TrendingTvSeriesDailyEvent event,
      Emitter<TvSeriesDailyState> emit) async {
    emit(TvSeriesDailyLoadingState());
    try {
      List<dynamic> trendingMoviesWeekly =
          await moviesRepository.fetchMovies(date: daily, type: tvSeriesType, mediaType: MediaType.tvSeries);
      emit(TrendingTvSeriesDailyState(trendingMoviesWeekly));
    } catch (error) {
      emit(TvSeriesDailyErrorState(error.toString()));
    }
  }
}
