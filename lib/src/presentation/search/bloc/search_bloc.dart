import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/inputs/search_art_previews_input.dart';
import '../../../data/models/pagination/pagination.dart';
import '../../../data/models/preview/art_preview.dart';
import '../../../data/repositories/art_repository.dart';
import '../../../navigation/router.dart';
import '../../common/constants/app_constants.dart';

part 'search_event.dart';
part 'search_pagination_state.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ArtRepository _artRepository;
  final AppRouter _router;

  final StreamController<String> _queryController = StreamController<String>();

  SearchBloc({
    required ArtRepository artRepository,
    required AppRouter router,
  })  : _router = router,
        _artRepository = artRepository,
        super(
          const SearchIdle(suggestions: <String>{}),
        ) {
    on<SearchQueryEvent>(_onQuery);
    on<SearchCompletedEvent>(_handleSearchResult);
    on<SearchPaginateEvent>(_onPaginate);
    on<SearchScrollEvent>(_onScroll);
    on<SearchResultSelectedEvent>(_onSearchResultSelected);
    on<UpdateSearchSuggestionsEvent>(_onUpdateSearchSuggestions);
    _initializeStream();
  }

  void _initializeStream() {
    _queryController.stream
        .debounceTime(
          AppConstants.DEBOUNCE_DURATION,
        )
        .switchMap(
          (String query) => _searchArt(
            query: query,
            currentSuggestions: state.suggestions,
          ),
        )
        .listen(
      (SearchState state) {
        add(
          SearchCompletedEvent(
            resultState: state,
          ),
        );
      },
    );
  }

  void _onQuery(
    SearchQueryEvent event,
    Emitter<SearchState> emit,
  ) {
    _queryController.add(event.query);
  }

  Stream<SearchState> _searchArt({
    required String query,
    required Set<String> currentSuggestions,
  }) async* {
    try {
      yield SearchLoading(suggestions: currentSuggestions);

      final PaginatedResponse<ArtPreview> response = await _artRepository.searchArtPreviews(
        SearchArtPreviewsInput(
          query: query,
          limit: AppConstants.SEARCH_PAGE_LIMIT,
          page: AppConstants.DEFAULT_PAGE,
        ),
      );

      yield SearchSuccess(
        query: query,
        artPreviews: List<ArtPreview>.from(response.data),
        paginationState: SearchPaginationSuccess(
          pagination: response.pagination,
        ),
        suggestions: currentSuggestions,
      );
    } catch (e) {
      yield SearchFailure(suggestions: currentSuggestions);
    }
  }

  void _handleSearchResult(
    SearchCompletedEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(event.resultState);
  }

  void _onSearchResultSelected(
    SearchResultSelectedEvent event,
    Emitter<SearchState> emit,
  ) {
    _router.push(
      DetailsRoute(
        artId: event.artPreview.id,
        router: _router,
        artRepository: _artRepository,
      ),
    );
  }

  Future<void> _onPaginate(
    SearchPaginateEvent event,
    Emitter<SearchState> emit,
  ) async {
    final SearchState state = this.state;

    if (state is! SearchSuccess) return;

    try {
      emit(
        state.copyWith(
          paginationState: const SearchPaginationLoading(),
        ),
      );

      final PaginatedResponse<ArtPreview> response = await _artRepository.searchArtPreviews(
        SearchArtPreviewsInput(
          query: state.query,
          limit: event.limit,
          page: event.page,
        ),
      );

      emit(
        state.copyWith(
          artPreviews: state.artPreviews..addAll(response.data),
          paginationState: SearchPaginationSuccess(
            pagination: response.pagination,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          paginationState: const SearchPaginationFailure(),
        ),
      );
    }
  }

  void _onUpdateSearchSuggestions(
    UpdateSearchSuggestionsEvent event,
    Emitter<SearchState> emit,
  ) {
    final SearchState state = this.state;

    if (state is! SearchSuccess) return;

    if (event.suggestion.isEmpty) return;

    final Set<String> updateSuggestions = Set<String>.from(state.suggestions);
    updateSuggestions.add(event.suggestion);

    emit(
      state.copyWith(suggestions: updateSuggestions),
    );
  }

  Future<void> _onScroll(
    SearchScrollEvent event,
    Emitter<SearchState> emit,
  ) async {
    final SearchState state = this.state;

    if (state is! SearchSuccess) return;

    final SearchPaginationState paginationState = state.paginationState;

    if (paginationState is! SearchPaginationSuccess) return;
    if (paginationState.hasReachedEnd) return;

    add(
      SearchPaginateEvent(
        limit: paginationState.pagination.limit,
        page: paginationState.pagination.currentPage + 1,
      ),
    );
  }

  @override
  Future<void> close() async {
    _queryController.close();
    super.close();
  }
}
