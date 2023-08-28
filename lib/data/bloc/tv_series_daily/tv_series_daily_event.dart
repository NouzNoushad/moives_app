part of 'tv_series_daily_bloc.dart';

sealed class TvSeriesDailyEvent extends Equatable {
  const TvSeriesDailyEvent();

  @override
  List<Object> get props => [];
}

class TrendingTvSeriesDailyEvent extends TvSeriesDailyEvent {
  const TrendingTvSeriesDailyEvent();

  @override
  List<Object> get props => [];
}
