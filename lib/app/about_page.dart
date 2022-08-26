import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notes/constants/constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "images/notes.png",
                  width: 90,
                  height: 90,
                ),
                Text(
                  kAppName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Iconsax.cpu),
                ),
                title: Text("App Version"),
                subtitle: Text("1.0"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kGlobalOuterPadding,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Devloped By',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () async {
                if (await canLaunch('https://github.com/ibrahim14ibs')) {
                  await launch(
                    'https://github.com/ibrahim14ibs',
                    forceSafariVC: false,
                    forceWebView: false,
                  );
                } else {
                  throw 'Could not launch';
                }
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Iconsax.user),
                ),
                title: Text('Ebrahim Saeed Himadiah'),
                subtitle: Text('Flutter Devloper'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kGlobalOuterPadding,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Links',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () async {
                if (await canLaunch('https://wa.me/967774382863')) {
                  await launch(
                    'https://wa.me/967774382863',
                    forceSafariVC: false,
                    forceWebView: false,
                  );
                } else {
                  throw 'Could not launch';
                }
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(LineIcons.whatSApp),
                ),
                title: Text('WhatsApp'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
