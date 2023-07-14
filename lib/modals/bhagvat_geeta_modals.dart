// ignore_for_file: camel_case_types, non_constant_identifier_names

class bhagvatGitaJsonModals {

  // Attribute
  final int chapter_number;
  final int verses_count;
  final String name;
  final String translation;
  // final String meaning;
  // final String summary;

  // parameterised Constructor
  bhagvatGitaJsonModals({
    required this.chapter_number,
    required this.verses_count,
    required this.name,
    required this.translation,
    // required this.meaning,
    // required this.summary,
  });

  // Factory Constructor
  factory bhagvatGitaJsonModals.fromMap({required Map verses}) {
    return bhagvatGitaJsonModals(
      chapter_number: verses['chapter_number'],
      verses_count: verses['verses_count'],
      name: verses['name'],
      translation: verses['translation'],
      // meaning: verses['meaning'],
      // summary: verses['summary'],
    );
  }
}
