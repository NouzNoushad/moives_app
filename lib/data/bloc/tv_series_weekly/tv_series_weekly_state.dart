part of 'tv_series_weekly_bloc.dart';

sealed class TvSeriesWeeklyState extends Equatable {
  const TvSeriesWeeklyState();
  
  @override
  List<Object> get props => [];
}

final class TvSeriesWeeklyInitial extends TvSeriesWeeklyState {}

final class TvSeriesWeeklyLoadingState extends TvSeriesWeeklyState {}

final class TrendingTvSeriesWeeklyState extends TvSeriesWeeklyState {
  final List<dynamic> trendingSeriesWeekly;
  const TrendingTvSeriesWeeklyState(this.trendingSeriesWeekly);

  @override
  List<Object> get props => [trendingSeriesWeekly];
}

final class TvSeriesWeeklyErrorState extends TvSeriesWeeklyState {
  final String error;
  const TvSeriesWeeklyErrorState(this.error);

  @override
  List<Object> get props => [error];
}
