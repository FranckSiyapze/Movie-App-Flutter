import 'dart:convert';

class AppConfig {
  final String BASE_API_URL;
  final String BASE_IMAGE_API_URL;
  final String API_KEY;
  AppConfig({
    required this.BASE_API_URL,
    required this.BASE_IMAGE_API_URL,
    required this.API_KEY,
  });

  AppConfig copyWith({
    String? BASE_API_URL,
    String? BASE_IMAGE_API_URL,
    String? API_KEY,
  }) {
    return AppConfig(
      BASE_API_URL: BASE_API_URL ?? this.BASE_API_URL,
      BASE_IMAGE_API_URL: BASE_IMAGE_API_URL ?? this.BASE_IMAGE_API_URL,
      API_KEY: API_KEY ?? this.API_KEY,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'BASE_API_URL': BASE_API_URL,
      'BASE_IMAGE_API_URL': BASE_IMAGE_API_URL,
      'API_KEY': API_KEY,
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      BASE_API_URL: map['BASE_API_URL'] ?? '',
      BASE_IMAGE_API_URL: map['BASE_IMAGE_API_URL'] ?? '',
      API_KEY: map['API_KEY'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppConfig(BASE_API_URL: $BASE_API_URL, BASE_IMAGE_API_URL: $BASE_IMAGE_API_URL, API_KEY: $API_KEY)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppConfig &&
        other.BASE_API_URL == BASE_API_URL &&
        other.BASE_IMAGE_API_URL == BASE_IMAGE_API_URL &&
        other.API_KEY == API_KEY;
  }

  @override
  int get hashCode =>
      BASE_API_URL.hashCode ^ BASE_IMAGE_API_URL.hashCode ^ API_KEY.hashCode;
}
