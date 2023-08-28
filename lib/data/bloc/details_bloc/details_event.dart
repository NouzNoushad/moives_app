part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsLoadedEvent extends DetailsEvent {
  final String mediaType;
  final int movieId;
  const DetailsLoadedEvent(this.mediaType, this.movieId);

  @override
  List<Object> get props => [mediaType, movieId];
}
