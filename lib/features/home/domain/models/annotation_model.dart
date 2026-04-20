class AnnotationModel {
  final int? id;
  final String userId;
  final String title;
  final String description;

  const AnnotationModel({
    this.id,
    this.userId = '',
    required this.title,
    required this.description,
  });

  AnnotationModel copyWith({
    int? id,
    String? userId,
    String? title,
    String? description,
  }) {
    return AnnotationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  static Map<String, dynamic> toJson(
    AnnotationModel annotation, {
    bool update = false,
  }) {
    if (update) {
      return {
        'id': annotation.id,
        'user_id': annotation.userId,
        'title': annotation.title,
        'description': annotation.description,
      };
    }
    return {
      'user_id': annotation.userId,
      'title': annotation.title,
      'description': annotation.description,
    };
  }

  static AnnotationModel fromJson(Map<String, dynamic> json) {
    return AnnotationModel(
      id: json['id'] ?? -1,
      userId: json['user_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
