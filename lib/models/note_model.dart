class NoteModel {
  // members
  late String name;
  late DateTime time;

  // constructor
  NoteModel({
    required this.name,
    required this.time,
  });

  // fromJson
  NoteModel.fromJson(Map json) {
    name = json["name"];
    time = DateTime.parse(json["time"]);
  }

  // toJson
  Map toJson() => {
    "name": name,
    "time": time.toIso8601String(),
  };
}
