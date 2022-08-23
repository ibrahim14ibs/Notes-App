import 'package:flutter/material.dart';
import 'package:notes/models/notemodel.dart';

class CardNotes extends StatelessWidget {
  final void Function() ontap;
  final NoteModel notemodel;
  final void Function()? onDelete;
  const CardNotes(
      {Key? key,
      required this.ontap,
      required this.notemodel,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: ListTile(
          title: Text("${notemodel.notesTitle}"),
          subtitle: Text("${notemodel.notesContent}"),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
