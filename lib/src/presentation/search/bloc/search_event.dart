part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchQueryEvent extends SearchEvent {
  final String query;

  const SearchQueryEvent({
    required this.query,
  });
}

final class SearchCompletedEvent extends SearchEvent {
  final SearchState resultState;

  const SearchCompletedEvent({
    required this.resultState,
  });
}

final class SearchPaginateEvent extends SearchEvent {
  final int limit;
  final int page;

  const SearchPaginateEvent({
    required this.limit,
    required this.page,
  });
}

final class SearchScrollEvent extends SearchEvent {
  final double offset;
  final double maxOffset;

  const SearchScrollEvent({
    required this.offset,
    required this.maxOffset,
  });
}

final class UpdateSearchSuggestionsEvent extends SearchEvent {
  final String suggestion;

  const UpdateSearchSuggestionsEvent({
    required this.suggestion,
  });
}

final class SearchResultSelectedEvent extends SearchEvent {
  final ArtPreview artPreview;

  const SearchResultSelectedEvent({
    required this.artPreview,
  });
}
