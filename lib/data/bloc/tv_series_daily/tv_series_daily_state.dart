part of 'tv_series_daily_bloc.dart';

sealed class TvSeriesDailyState extends Equatable {
  const TvSeriesDailyState();
  
  @override
  List<Object> get props => [];
}

final class TvSeriesDailyInitial extends TvSeriesDailyState {}

final class TvSeriesDailyLoadingState extends TvSeriesDailyState {}

final class TrendingTvSeriesDailyState extends TvSeriesDailyState {
  final List<dynamic> trendingTvSeriesDaily;
  const TrendingTvSeriesDailyState(this.trendingTvSeriesDaily);

  @override
  List<Object> get props => [trendingTvSeriesDaily];
}

final class TvSeriesDailyErrorState extends TvSeriesDailyState {
  final String error;
  const TvSeriesDailyErrorState(this.error);

  @override
  List<Object> get props => [error];
}
