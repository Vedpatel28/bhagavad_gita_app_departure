// ignore_for_file: camel_case_types, non_constant_identifier_names

class bhagvatGitaJsonModals {
  // Attribute
  final int chapter_number;
  final int verses_count;
  final String title;
  final String textHindi;
  final String transliteration;

  // parameterised Constructor
  bhagvatGitaJsonModals({
    required this.chapter_number,
    required this.verses_count,
    required this.title,
    required this.textHindi,
    required this.transliteration,
  });

  // Factory Constructor
  factory bhagvatGitaJsonModals.fromMap({required Map verses}) {
    return bhagvatGitaJsonModals(
      chapter_number: verses['chapter_number'],
      verses_count: verses['verse_number'],
      title: verses['title'],
      textHindi: verses['text'],
      transliteration: verses['transliteration'],
    );
  }
}
