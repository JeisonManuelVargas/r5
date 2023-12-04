class TaskModel {
  String id;
  String language;
  String nameTask;
  String creatorName;
  String description;
  DateTime dateCreated;

  TaskModel({
    required this.id,
    required this.language,
    required this.nameTask,
    required this.creatorName,
    required this.dateCreated,
    required this.description,
  });

  factory TaskModel.fromJson(json, id) => TaskModel(
    id: id,
    language: json["language"] ?? "",
    nameTask: json["name_task"] ?? "",
    creatorName: json["creator_id"] ?? "",
    description: json["description"] ?? "",
    dateCreated: json["date_created"].toDate(),
  );

  factory TaskModel.init() => TaskModel(
    id: "",
    language: "",
    nameTask: "",
    creatorName: "",
    description: "",
    dateCreated: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "name_task": nameTask,
    "date_created": dateCreated,
    "description": description,
    "creator_id": creatorName,
  };
}
