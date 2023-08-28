part of 'movies_daily_bloc.dart';

sealed class MoviesDailyEvent extends Equatable {
  const MoviesDailyEvent();

  @override
  List<Object> get props => [];
}

class TrendingMoviesDailyEvent extends MoviesDailyEvent {
  const TrendingMoviesDailyEvent();

  @override
  List<Object> get props => [];
}
