class NoteModel {
  String? notesId;
  String? notesTitle;
  String? notesContent;
  String? notesUsers;

  NoteModel(
      {this.notesId,
      this.notesTitle,
      this.notesContent,
      this.notesUsers});

  NoteModel.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesUsers = json['notes_users'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['notes_id'] = this.notesId;
  //   data['notes_title'] = this.notesTitle;
  //   data['notes_content'] = this.notesContent;
  //   data['notes_image'] = this.notesImage;
  //   data['notes_users'] = this.notesUsers;
  //   return data;
  // }
}