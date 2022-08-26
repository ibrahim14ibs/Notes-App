import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:notes/app/auth/login.dart';
import 'package:notes/app/notes/add.dart';
import 'package:notes/app/notes/edit.dart';
import 'package:notes/components/cardnote.dart';
import 'package:notes/components/crud.dart';

import 'package:notes/constants/constants.dart';
import 'package:notes/main.dart';
import 'package:notes/models/notemodel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title})
      : super(key: HomePage.staticGlobalKey);
  final String title;

  static final GlobalKey<_HomePageState> staticGlobalKey =
      new GlobalKey<_HomePageState>();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewNotes, {"id": prefs.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                prefs.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }), (route) => false);
              },
              icon: Icon(Icons.exit_to_app_outlined))
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'Notes',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          titlePadding: EdgeInsets.only(left: 30, bottom: 15),
        ),
      ),
      body: FutureBuilder(
          future: getNotes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['status'] == 'fail')
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Icon(
                                Iconsax.note_1,
                                size: 100,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'empty!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: CardNotes(
                          onDelete: () async {
                            var response = await postRequest(linkDeleteNotes, {
                              "id": snapshot.data['data'][i]['notes_id']
                                  .toString()
                            });
                            if (response['status'] == "success") {
                              setState(() {});
                            }
                          },
                          ontap: () async {
                            final refresh = await Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EditNotes(
                                        notes: snapshot.data['data'][i])));

                            if (refresh == true) {
                              print(refresh);
                              setState(() {});
                            }
                          },
                          notemodel:
                              NoteModel.fromJson(snapshot.data['data'][i])),
                    );
                  });
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text("Loading ..."));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        onPressed: () async {
          final refresh = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return AddNotes();
          }));
          if (refresh == true) {
            setState(() {
              print(refresh);
            });
          }
        },
        child: Icon(Iconsax.add),
      ),
    );
  }
}
