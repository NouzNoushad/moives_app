part of 'movies_daily_bloc.dart';

sealed class MoviesDailyState extends Equatable {
  const MoviesDailyState();

  @override
  List<Object> get props => [];
}

final class MoviesDailyInitial extends MoviesDailyState {}

final class MoviesDailyLoadingState extends MoviesDailyState {}

final class TrendingMoviesDailyState extends MoviesDailyState {
  final List<dynamic> trendingMoviesDaily;
  const TrendingMoviesDailyState(this.trendingMoviesDaily);

  @override
  List<Object> get props => [trendingMoviesDaily];
}

final class MoviesDailyErrorState extends MoviesDailyState {
  final String error;
  const MoviesDailyErrorState(this.error);

  @override
  List<Object> get props => [error];
}
