/// string_extensions.dart
/// Handy String extension utilities for Flutter/Dart projects.
/// Self-contained, no external packages required.
///
/// Put this file in your `lib/` (for example `lib/utils/string_extensions.dart`)
/// and import where needed:
/// ```dart
/// import 'package:your_package/utils/string_extensions.dart';
/// ```
library;

extension NullableStringExtensions on String? {
  /// Checks if the string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Checks if the string is null or blank (only whitespace).
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  /// Safely returns the string or an empty string if null.
  String orEmpty() => this ?? '';
}

extension StringExtensions on String {
  /// Trim and then check if length is zero.
  bool get isBlank => trim().isEmpty;

  /// Returns the string with the first letter capitalized and the rest unchanged.
  /// Example: 'hello' -> 'Hello'
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Returns the string in sentence case: first character uppercase, rest lowercase.
  /// Example: 'hello WORLD' -> 'Hello world'
  String toSentenceCase() {
    final t = trim();
    if (t.isEmpty) return '';
    return t[0].toUpperCase() + t.substring(1).toLowerCase();
  }

  /// Returns the string in Title Case.
  /// Example: 'hello world' -> 'Hello World'
  String toTitleCase() {
    if (isEmpty) return this;
    return splitMapJoin(
          RegExp(r"\s+"),
          onNonMatch: (m) => m,
          onMatch: (m) => m.group(0)!,
        )
        .split(RegExp(r"\s+"))
        .map(
          (word) => word.isEmpty
              ? ''
              : (word[0].toUpperCase() + word.substring(1).toLowerCase()),
        )
        .join(' ');
  }

  /// Convert to camelCase (first word lowercase, following words capitalized)
  /// Example: 'hello world' -> 'helloWorld'
  String toCamelCase() {
    final parts = _splitWords();
    if (parts.isEmpty) return '';
    final head = parts.first.toLowerCase();
    final tail = parts.skip(1).map((p) => p.capitalize()).join();
    return head + tail;
  }

  /// Convert to PascalCase (every word capitalized)
  /// Example: 'hello world' -> 'HelloWorld'
  String toPascalCase() {
    final parts = _splitWords();
    return parts.map((p) => p.capitalize()).join();
  }

  /// Convert to snake_case
  /// Example: 'Hello World' -> 'hello_world'
  String toSnakeCase() {
    final parts = _splitWords();
    return parts.map((p) => p.toLowerCase()).join('_');
  }

  /// Convert to kebab-case
  String toKebabCase() => _splitWords().map((p) => p.toLowerCase()).join('-');

  /// Create URL-friendly slug
  /// Example: 'Hello, World!' -> 'hello-world'
  String toSlug() {
    final noDiacritics = removeDiacritics();
    final onlyAscii = noDiacritics.replaceAll(RegExp(r"[^A-Za-z0-9\s-]"), '');
    final replaced = onlyAscii.trim().replaceAll(RegExp(r"[\s_-]+"), '-');
    return replaced.toLowerCase();
  }

  /// Remove common diacritics (accents) from letters.
  /// Good for simple normalization without external packages.
  String removeDiacritics() {
    var s = this;
    const from = 'ÀÁÂÃÄÅàáâãäåÈÉÊËèéêëÌÍÎÏìíîïÒÓÔÕÖØòóôõöøÙÚÛÜùúûüÝýÿÑñÇç';
    const to = 'AAAAAAaaaaaaEEEEeeeeIIIIiiiiOOOOOOooooooUUUUuuuuYyyNnCc';
    for (var i = 0; i < from.length; i++) {
      s = s.replaceAll(from[i], to[i]);
    }
    return s;
  }

  /// Normalize spaces: collapse multiple whitespace into a single space and trim.
  String normalizeSpaces() => replaceAll(RegExp(r"\s+"), ' ').trim();

  /// Truncate a string and add an ellipsis if needed.
  String truncate(int maxLength, {String omission = '...'}) {
    if (maxLength <= 0) return '';
    if (length <= maxLength) return this;
    final allowed = maxLength - omission.length;
    if (allowed <= 0) return omission.substring(0, maxLength);
    return substring(0, allowed) + omission;
  }

  /// Case-insensitive contains.
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());

  /// Case-insensitive equality.
  bool equalsIgnoreCase(String other) => toLowerCase() == other.toLowerCase();

  /// Parse common true/false strings to bool.
  /// Returns [orElse] when cannot parse.
  bool toBool({bool orElse = false}) {
    final v = trim().toLowerCase();
    if (['true', '1', 'yes', 'y', 'on'].contains(v)) return true;
    if (['false', '0', 'no', 'n', 'off'].contains(v)) return false;
    return orElse;
  }

  /// Parse int safely, returns [orElse] if parsing fails.
  int toInt({int orElse = 0}) {
    return int.tryParse(trim()) ?? orElse;
  }

  /// Parse double safely, returns [orElse] if parsing fails.
  double toDouble({double orElse = 0.0}) {
    return double.tryParse(trim()) ?? orElse;
  }

  /// URL encode (component)
  String urlEncode() => Uri.encodeComponent(this);

  /// URL decode
  String urlDecode() => Uri.decodeComponent(this);

  /// Wrap string with given [left] and [right] (right defaults to left)
  String wrap(String left, [String? right]) {
    return '$left$this${right ?? left}';
  }

  /// Repeat the string [count] times.
  String repeat(int count) {
    if (count <= 0) return '';
    final sb = StringBuffer();
    for (var i = 0; i < count; i++) {
      sb.write(this);
    }
    return sb.toString();
  }

  /// Private helper: split into word-like parts for case conversions.
  List<String> _splitWords() {
    final cleaned = replaceAll(RegExp(r"[_\-]+"), ' ');
    final parts = cleaned
        .split(
          RegExp(r"\s+|(?=[A-Z])"),
        ) // split by spaces or before capital letters
        .where((p) => p.isNotEmpty)
        .map((p) => p.replaceAll(RegExp(r"[^A-Za-z0-9]"), ''))
        .where((p) => p.isNotEmpty)
        .toList();
    return parts;
  }
}

/*
Example usage:

import 'package:your_package/utils/string_extensions.dart';

void main() {
  final s = 'Hello World';
  print(s.toSentenceCase()); // Hello world
  print(s.toTitleCase()); // Hello World
  print(s.toCamelCase()); // helloWorld
  print(s.toKebabCase()); // hello-world
  print(s.toSlug()); // hello-world
}
*/
