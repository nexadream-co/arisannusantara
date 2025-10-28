/// Generates a list of lowercase prefix tokens for Firestore full-text–like search.
///
/// This helper creates a `search_index` array that supports prefix-based
/// searches using `arrayContains` queries in Firestore. It takes multiple
/// string fields (e.g., `name`, `code`, etc.), converts them to lowercase,
/// and generates incremental prefixes for both the full phrase and each word.
///
/// Example:
/// ```dart
/// final index = generateSearchIndex(["Arisan Digital", "CODE123"]);
/// print(index);
/// ```
///
/// Output (simplified):
/// ```
/// [
///   "a", "ar", "ari", "aris", "arisa", "arisan",
///   "arisan ", "arisan d", "arisan di", ..., "arisan digital",
///   "c", "co", "cod", "code", "code1", "code12", "code123"
/// ]
/// ```
///
/// You can then store this array in Firestore:
/// ```dart
/// 'search_index': generateSearchIndex([group.name, group.code]),
/// ```
///
/// and perform queries like:
/// ```dart
/// .where('search_index', arrayContains: 'aris')
/// ```
/// to find documents whose `name` or `code` starts with "aris".
List<String> generateSearchIndex(List<String?> fields) {
  final tokens = <String>{};

  for (final field in fields) {
    if (field == null || field.trim().isEmpty) continue;

    final text = field.toLowerCase().trim();

    // Generate prefix tokens for the entire string
    for (int i = 1; i <= text.length; i++) {
      tokens.add(text.substring(0, i));
    }

    // Also generate tokens per word to improve matches
    final words = text.split(' ');
    for (final word in words) {
      if (word.isEmpty) continue;
      for (int i = 1; i <= word.length; i++) {
        tokens.add(word.substring(0, i));
      }
    }
  }

  return tokens.toList();
}
