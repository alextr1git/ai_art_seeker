class SearchBarHelper {
  static List<String> updateSuggestions({
    required List<String> allSuggestions,
    required String query,
  }) {
    if (allSuggestions.isEmpty) {
      return allSuggestions;
    }

    final List<String> words = query
        .replaceAll(RegExp(r"[^\w\s']"), '')
        .split(' ')
        .where((String word) => word.isNotEmpty)
        .toList();

    final List<String> relevantSuggestions = allSuggestions
        .where(
          (String suggestion) => words.any(
            (String word) => suggestion.contains(word),
          ),
        )
        .toList();

    return relevantSuggestions.isEmpty && query.isEmpty
        ? allSuggestions.toList()
        : relevantSuggestions;
  }
}
