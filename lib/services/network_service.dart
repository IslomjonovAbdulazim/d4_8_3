import 'dart:convert';

import 'package:d4_8_3/models/note_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static const baseUrl =
      "https://67f908e6094de2fe6ea0349e.mockapi.io/note_model";

  static Future<List<NoteModel>> getAllNotes() async {
    List<NoteModel> result = [];
    Uri uri = Uri.parse(baseUrl);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonList = List.from(jsonDecode(response.body));
      result = jsonList.map((json) => NoteModel.fromJson(json)).toList();
    }
    return result;
  }

  static Future<void> createNote(NoteModel model) async {
    Uri uri = Uri.parse(baseUrl);
    await http.post(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {"Content-Type": "application/json"},
    );
  }

  static Future<void> updateNote(NoteModel model) async {
    Uri uri = Uri.parse("$baseUrl/${model.id}");
    await http.put(
      uri,
      body: jsonEncode(model.toJson()),
      headers: {"Content-Type": "application/json"},
    );
  }

  static Future<void> deleteNote(NoteModel model) async {
    Uri uri = Uri.parse("$baseUrl/${model.id}");
    await http.delete(uri);
  }
}














