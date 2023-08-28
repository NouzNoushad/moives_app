import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/bloc/details_bloc/details_bloc.dart';
import 'package:movies_app/utils/colors.dart';
import 'package:movies_app/utils/constant.dart';

import '../utils/end_points.dart';

class MoviesDetails extends StatefulWidget {
  final dynamic movie;
  const MoviesDetails({super.key, required this.movie});

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  void initState() {
    context
        .read<DetailsBloc>()
        .add(DetailsLoadedEvent(widget.movie.mediaType, widget.movie.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: whiteColor,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast),
                color: whiteColor,
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            Container(
              height: 220,
              // width: 110,
              color: transparentColor,
              child: Image.network(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width,
                EndPoints.imageEndPoint(widget.movie.backdropPath),
              ),
            ),
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                if (state is DetailsLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movie.mediaType == moviesType
                              ? widget.movie.title
                              : widget.movie.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 40,
                            width: double.infinity,
                            // color: Colors.yellow,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                              itemCount: state.detailsResponse.genres.length,
                              itemBuilder: (context, index) {
                                var genre = state.detailsResponse.genres[index];
                                return Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1.2, color: Colors.white),
                                    ),
                                    child: Text(
                                      genre.name,
                                    ),
                                  ),
                                );
                              },
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.detailsResponse.overview,
                          style: const TextStyle(height: 1.8, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: loadingColor,
                  ),
                );
              },
            )
          ]))
        ],
      ),
    );
  }
}
