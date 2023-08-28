part of 'movies_weekly_bloc.dart';

sealed class MoviesWeeklyEvent extends Equatable {
  const MoviesWeeklyEvent();

  @override
  List<Object> get props => [];
}

class TrendingMoviesWeeklyEvent extends MoviesWeeklyEvent {
  const TrendingMoviesWeeklyEvent();

  @override
  List<Object> get props => [];
}
