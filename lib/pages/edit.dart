import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notes/common/constants.dart';
import 'package:notes/crud.dart';
import 'package:notes/pages/customtextform.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/valid.dart';

class EditNotes extends StatefulWidget {
  final notes;
  EditNotes({Key? key, this.notes}) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> with Crud {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  bool isLoading = false;

  editNotes() async {
    if (formstate.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await postRequest(linkEditNotes, {
        "title": title.text,
        "content": content.text,
        "id": widget.notes['notes_id'].toString(),
      });

      isLoading = false;
      setState(() {});
      if (response['status'] == "success") {
        Navigator.of(context).pop(true);
      } else {
        Navigator.of(context).pop(true);
      }
    }
  }

  @override
  void initState() {
    title.text = widget.notes['notes_title'];
    content.text = widget.notes['notes_content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Notes"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formstate,
                child: ListView(
                  children: [
                    CustTextFormSign(
                        hint: "title",
                        mycontroller: title,
                        valid: (val) {
                          return validInput(val!, 1, 40);
                        }),
                    CustTextFormSign(
                        hint: "content",
                        mycontroller: content,
                        valid: (val) {
                          return validInput(val!, 10, 255);
                        }),
                    Container(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await editNotes();
                      },
                      child: Text("Save"),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
