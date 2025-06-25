part of 'details_bloc.dart';

sealed class DetailsState {
  const DetailsState();
}

final class DetailsLoading extends DetailsState {
  const DetailsLoading();
}

final class DetailsLoaded extends DetailsState {
  final ArtDetails details;

  const DetailsLoaded(this.details);
}

final class DetailsLoadFailure extends DetailsState {
  const DetailsLoadFailure();
}
