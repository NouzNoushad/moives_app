import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/repositories/movies_repository.dart';

import '../../models/trending_details.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final MoviesRepository moviesRepository;
  DetailsBloc({required this.moviesRepository}) : super(DetailsInitial()) {
    on<DetailsLoadedEvent>(movieDetails);
  }

  FutureOr<void> movieDetails(
      DetailsLoadedEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoadingState());
    try {
      DetailsResponse detailsResponse = await moviesRepository.getMoviesDetails(
          event.mediaType, event.movieId);
      emit(DetailsLoadedState(detailsResponse));
    } catch (error) {
      emit(DetailsErrorState(error.toString()));
    }
  }
}
