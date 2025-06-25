abstract class AppConstants {
  static const String SEARCH_ROUTE = '/search';
  static const String EMPTY_TEXT = '';
  static const Duration DEBOUNCE_DURATION = Duration(milliseconds: 300);
  static const int SEARCH_PAGE_LIMIT = 20;
  static const int DEFAULT_PAGE = 1;
  static const Set<String> IGNORED_TAGS = <String>{'a'};

  static const double MAX_SUGGESTIONS_SECTION_HEIGHT = 300.0;
  static const double SUGGESTION_HEIGHT = 70.0;

  static const int TEXT_MAX_LINES = 2;

  static const double SCROLL_THRESHOLD = 0.9;

  static const int shadowAlpha = 40;
}
