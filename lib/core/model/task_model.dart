class TaskModel {
  String nameTask;
  dynamic dateCreated;
  String description;
  String creatorId;

  TaskModel({
    required this.nameTask,
    required this.dateCreated,
    required this.description,
    required this.creatorId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    nameTask: json["name_task"],
    dateCreated: json["date_created"],
    description: json["description"],
    creatorId: json["creator_id"],
  );

  Map<String, dynamic> toJson() => {
    "name_task": nameTask,
    "date_created": dateCreated,
    "description": description,
    "creator_id": creatorId,
  };
}
