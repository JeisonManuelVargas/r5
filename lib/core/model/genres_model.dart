class GenresModel {
  int id;
  String name;

  GenresModel({
    required this.id,
    required this.name,
  });

  GenresModel copyWith({
    int? id,
    String? name,
  }) =>
      GenresModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory GenresModel.fromJson(json) => GenresModel(
        id: json['id'],
        name: json["name"],
      );

  factory GenresModel.init() => GenresModel(
        id: 0,
        name: "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
