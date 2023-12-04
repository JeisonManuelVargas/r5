class TaskModel {
  String nameTask;
  String creatorName;
  String description;
  DateTime dateCreated;

  TaskModel({
    required this.nameTask,
    required this.creatorName,
    required this.dateCreated,
    required this.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    nameTask: json["name_task"],
    dateCreated: json["date_created"],
    description: json["description"],
    creatorName: json["creator_id"],
  );

  factory TaskModel.init() => TaskModel(
    nameTask: "",
    creatorName: "",
    description: "",
    dateCreated: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "name_task": nameTask,
    "date_created": dateCreated,
    "description": description,
    "creator_id": creatorName,
  };
}
