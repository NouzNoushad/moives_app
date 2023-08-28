part of 'movies_weekly_bloc.dart';

sealed class MoviesWeeklyState extends Equatable {
  const MoviesWeeklyState();
  
  @override
  List<Object> get props => [];
}

final class MoviesWeeklyInitial extends MoviesWeeklyState {}

final class MoviesWeeklyLoadingState extends MoviesWeeklyState {}

final class TrendingMoviesWeeklyState extends MoviesWeeklyState {
  final List<dynamic> trendingMoviesWeekly;
  const TrendingMoviesWeeklyState(this.trendingMoviesWeekly);

  @override
  List<Object> get props => [trendingMoviesWeekly];
}

final class MoviesWeeklyErrorState extends MoviesWeeklyState {
  final String error;
  const MoviesWeeklyErrorState(this.error);

  @override
  List<Object> get props => [error];
}
