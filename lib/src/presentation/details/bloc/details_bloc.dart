import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/details/art_details.dart';
import '../../../data/repositories/art_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final ArtRepository _artRepository;

  DetailsBloc({
    required ArtRepository artRepository,
  })  : _artRepository = artRepository,
        super(const DetailsLoading()) {
    on<FetchDetailsEvent>(_onFetchDetails);
  }

  Future<void> _onFetchDetails(
    FetchDetailsEvent event,
    Emitter<DetailsState> emit,
  ) async {
    try {
      final ArtDetails response = await _artRepository.fetchArtDetails(
        event.artId,
      );

      emit(DetailsLoaded(response));
    } catch (e) {
      emit(const DetailsLoadFailure());
    }
  }
}
