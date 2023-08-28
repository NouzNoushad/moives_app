part of 'tv_series_weekly_bloc.dart';

sealed class TvSeriesWeeklyEvent extends Equatable {
  const TvSeriesWeeklyEvent();

  @override
  List<Object> get props => [];
}

class TrendingTvSeriesWeeklyEvent extends TvSeriesWeeklyEvent {
  const TrendingTvSeriesWeeklyEvent();

  @override
  List<Object> get props => [];
}
