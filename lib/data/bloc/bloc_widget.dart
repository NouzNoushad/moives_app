import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/bloc/details_bloc/details_bloc.dart';
import 'package:movies_app/data/bloc/movies_weekly/movies_weekly_bloc.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import 'movies_daily/movies_daily_bloc.dart';
import 'tv_series_daily/tv_series_daily_bloc.dart';
import 'tv_series_weekly/tv_series_weekly_bloc.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoviesRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoviesWeeklyBloc(
              moviesRepository:
                  RepositoryProvider.of<MoviesRepository>(context),
            )..add(const TrendingMoviesWeeklyEvent()),
          ),
          BlocProvider(
            create: (context) => MoviesDailyBloc(
              moviesRepository:
                  RepositoryProvider.of<MoviesRepository>(context),
            )..add(const TrendingMoviesDailyEvent()),
          ),
          BlocProvider(
            create: (context) => TvSeriesWeeklyBloc(
              moviesRepository:
                  RepositoryProvider.of<MoviesRepository>(context),
            )..add(const TrendingTvSeriesWeeklyEvent()),
          ),
          BlocProvider(
            create: (context) => TvSeriesDailyBloc(
              moviesRepository:
                  RepositoryProvider.of<MoviesRepository>(context),
            )..add(const TrendingTvSeriesDailyEvent()),
          ),
          BlocProvider(
            create: (context) => DetailsBloc(moviesRepository: RepositoryProvider.of<MoviesRepository>(context)))
        ],
        child: child,
      ),
    );
  }
}
