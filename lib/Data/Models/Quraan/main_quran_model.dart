class MainQuranModel {
  final String name;
  final String name_en;
  final String name_translation;
  final num words;
  final num id;
  final List<ArreyContent> array;

  MainQuranModel(
      {required this.name,
      required this.name_en,
      required this.name_translation,
      required this.words,
      required this.array,
      required this.id});
  factory MainQuranModel.fromjson(Map<String, dynamic> json) {
    final currantArrey = json['array'] as List? ?? [];
    final array = currantArrey.map((array) {
      return ArreyContent.fromjson(array);
    }).toList();
    return MainQuranModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        name_en: json['name_en'] ?? '',
        name_translation: json['name_translation'] ?? '',
        words: json['words'] ?? 0,
        array: array);
  }
}

class ArreyContent {
  final String ar;
  final String en;
  final num id;

  ArreyContent({required this.ar, required this.en, required this.id});
  factory ArreyContent.fromjson(Map<String, dynamic> json) {
    return ArreyContent(
      ar: json['ar'] ?? '',
      en: json['en'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
