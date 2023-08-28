part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final DetailsResponse detailsResponse;
  const DetailsLoadedState(this.detailsResponse);

  @override
  List<Object> get props => [detailsResponse];
}

class DetailsErrorState extends DetailsState {
  final String error;
  const DetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
