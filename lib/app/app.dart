import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes/app/about_page.dart';
import 'package:notes/app/home_page.dart';
import 'package:notes/constants/constants.dart';



class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
 

  late PageController _pageController;
  int _page = 0;

  final _pageList = <Widget>[
    new HomePage(
      title: kAppName,
    ),
    new AboutPage(),
  ];


  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: _pageList,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.info_circle),
            label: 'About',
          ),
        ],
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: navigationTapped,
      ),
    );
  }
}
