import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popupmenu_focused_example/page/multiple_menu_widget.dart';
import 'package:popupmenu_focused_example/page/single_menu_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Focused Popup Menu';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildPages(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              icon: Text('PopupMenu', style: TextStyle(color: Colors.white)),
              title: Text('Single'),
            ),
            BottomNavigationBarItem(
              icon: Text('PopupMenu', style: TextStyle(color: Colors.white)),
              title: Text('Multiple'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return SingleMenuWidget();
      case 1:
        return MultipleMenuWidget();
      default:
        return Container();
    }
  }
}
