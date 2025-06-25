part of 'details_bloc.dart';

sealed class DetailsEvent {
  const DetailsEvent();
}

final class FetchDetailsEvent extends DetailsEvent {
  final int artId;

  const FetchDetailsEvent({
    required this.artId,
  });
}
