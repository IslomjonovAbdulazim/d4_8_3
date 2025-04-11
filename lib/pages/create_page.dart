import 'package:d4_8_3/models/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final NoteModel? note;

  const CreatePage({super.key, this.note});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    controller.text = widget.note?.name ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Note Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              focusNode: focus,
              onTapOutside: (val) => focus.unfocus(),
              decoration: InputDecoration(
                hintText: "Note Details",
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {},
              child: Center(
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
