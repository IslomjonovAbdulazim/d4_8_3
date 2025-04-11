class NoteModel {
  // members
  late String name;
  late DateTime time;
  late String id;

  // constructor
  NoteModel({
    required this.name,
    required this.time,
    this.id = "-1",
  });

  // fromJson
  NoteModel.fromJson(Map json) {
    name = json["name"];
    time = DateTime.parse(json["time"]);
    id = json["id"];
  }

  // toJson
  Map toJson() => {
    "name": name,
    "time": time.toIso8601String(),
    "id": id,
  };
}
