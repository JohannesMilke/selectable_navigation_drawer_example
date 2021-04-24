import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:selectable_navigation_drawer_example/model/navigation_item.dart';
import 'package:selectable_navigation_drawer_example/page/favourites_page.dart';
import 'package:selectable_navigation_drawer_example/page/notifications_page.dart';
import 'package:selectable_navigation_drawer_example/page/people_page.dart';
import 'package:selectable_navigation_drawer_example/page/header_page.dart';
import 'package:selectable_navigation_drawer_example/page/plugins_page.dart';
import 'package:selectable_navigation_drawer_example/page/updates_page.dart';
import 'package:selectable_navigation_drawer_example/page/workflow_page.dart';
import 'package:selectable_navigation_drawer_example/provider/navigation_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.people:
        return PeoplePage();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.workflow:
        return WorkflowPage();
      case NavigationItem.updates:
        return UpdatesPage();
      case NavigationItem.plugins:
        return PluginsPage();
      case NavigationItem.notifications:
        return NotificationsPage();
    }
  }
}
