class MainAzkaarModel {
  final num id;
  final String category;
  final List<ArrayeContent> arraye;

  MainAzkaarModel(
      {required this.id, required this.category, required this.arraye});
  factory MainAzkaarModel.fromjson(Map<String, dynamic> json) {
    final currentArraye = json['array'] as List? ?? [];
    final arraye = currentArraye.map((arrayu) {
      return ArrayeContent.fromjson(arrayu);
    }).toList();
    return MainAzkaarModel(
      id: json['id'] ?? 0,
      category: json['category'] ?? '',
      arraye: arraye,
    );
  }
}

class ArrayeContent {
  final num id;
  final String text;
  final num count;

  ArrayeContent({required this.id, required this.text, required this.count});

  factory ArrayeContent.fromjson(Map<String, dynamic> json) {
    return ArrayeContent(
      id: json['id']??0,
      text: json['text']??'',
      count: json['count']??0,
    );
  }
}
