import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/bloc/movies_daily/movies_daily_bloc.dart';
import 'package:movies_app/data/bloc/movies_weekly/movies_weekly_bloc.dart';
import 'package:movies_app/data/bloc/tv_series_daily/tv_series_daily_bloc.dart';
import 'package:movies_app/utils/end_points.dart';
import '../data/bloc/tv_series_weekly/tv_series_weekly_bloc.dart';
import '../utils/colors.dart';
import '../widgets/movie_header.dart';

class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  double scrollOffset = 0.0;
  late final ScrollController scrollController = ScrollController()
    ..addListener(() {
      setState(() {
        scrollOffset = scrollController.offset;
      });
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      physics: const ClampingScrollPhysics(),
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverPersistentHeader(
              delegate: MovieHeader(
                scrollOffset: scrollOffset,
              ),
              pinned: true,
            ),
          ),
        ];
      }),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: const Alignment(0, 0.2),
                        colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ])),
                height: MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<MoviesWeeklyBloc, MoviesWeeklyState>(
                  builder: (context, state) {
                    if (state is TrendingMoviesWeeklyState) {
                      return Image.network(
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.width * 0.6,
                          width: MediaQuery.of(context).size.width,
                          'https://image.tmdb.org/t/p/original/${state.trendingMoviesWeekly.first.posterPath}');
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: loadingColor,
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Movies This Week',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<MoviesWeeklyBloc, MoviesWeeklyState>(
                builder: (context, state) {
                  if (state is TrendingMoviesWeeklyState) {
                    return trendingList(context, state.trendingMoviesWeekly);
                  }
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: loadingColor,
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Movies Today',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<MoviesDailyBloc, MoviesDailyState>(
                  builder: (context, state) {
                if (state is TrendingMoviesDailyState) {
                  return trendingList(context, state.trendingMoviesDaily);
                }
                return const SizedBox(
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: loadingColor,
                    ),
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Tv Shows This Week',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<TvSeriesWeeklyBloc, TvSeriesWeeklyState>(
                  builder: (context, state) {
                if (state is TrendingTvSeriesWeeklyState) {
                  return trendingList(context, state.trendingSeriesWeekly);
                }
                return const SizedBox(
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: loadingColor,
                    ),
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Trending Tv Shows Today',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<TvSeriesDailyBloc, TvSeriesDailyState>(
                  builder: (context, state) {
                if (state is TrendingTvSeriesDailyState) {
                  return trendingList(context, state.trendingTvSeriesDaily);
                }
                return const SizedBox(
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: loadingColor,
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    ));
  }

  Widget trendingList(BuildContext context, List<dynamic> trendingList) {
    return Container(
      height: 180,
      color: transparentColor,
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: trendingList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          var trending = trendingList[index];
          return Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  context.push('/details', extra: trending);
                },
                child: Container(
                  height: 220,
                  width: 110,
                  color: transparentColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.width * 0.6,
                      width: MediaQuery.of(context).size.width,
                      EndPoints.imageEndPoint(trending.posterPath),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
