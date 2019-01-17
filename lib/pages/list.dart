import 'package:flutter/material.dart';
import 'package:flutter_examples/flutter_multipage_form/main.dart';
import 'package:flutter_examples/fullscreen_dialog/dialog.dart';
import 'package:flutter_examples/fullscreen_dialog/fullscreen.dart';
import 'package:flutter_examples/fullscreen_dialog/dialog_screen.dart';
import 'package:flutter_examples/pages/InternetConnectivity.dart';
import 'package:flutter_examples/pages/async_widget.dart';

import 'package:flutter_examples/pages/card_demo.dart';
import 'package:flutter_examples/pages/custom_clock.dart';
import 'package:flutter_examples/pages/design.dart';
import 'package:flutter_examples/pages/drawer.dart';
import 'package:flutter_examples/pages/drop_down_list.dart';
import 'package:flutter_examples/pages/flutter_callback.dart';
import 'package:flutter_examples/pages/flutter_toast.dart';
import 'package:flutter_examples/pages/image_pick.dart';
import 'package:flutter_examples/pages/inherited_widgets.dart';
import 'package:flutter_examples/pages/list_load_infinite.dart';
import 'package:flutter_examples/pages/load_loacal_json.dart';
import 'package:flutter_examples/pages/load_more_listview.dart';
import 'package:flutter_examples/pages/location/location.dart';
import 'package:flutter_examples/pages/nested_toolbar.dart';
import 'package:flutter_examples/pages/page_view/pageview.dart';
import 'package:flutter_examples/pages/read_write/read_write_files.dart';
import 'package:flutter_examples/pages/refresh_indicator.dart';
import 'package:flutter_examples/pages/routing.dart';
import 'package:flutter_examples/pages/search_list.dart';
import 'package:flutter_examples/pages/segment_control.dart';
import 'package:flutter_examples/pages/snackbar-dialog.dart';
import 'package:flutter_examples/pages/test-state.dart';
import 'package:flutter_examples/pages/tool_tip.dart';
import 'package:flutter_examples/pages/upload_file.dart';
import 'package:flutter_examples/pages/walk_through.dart';
import 'package:flutter_examples/pages/webview-example.dart';
import 'package:flutter_examples/segment/segmentedcontrol.dart';

import '../model/page.dart';
import '../util/data.dart';
import '../util/method.dart';
import 'alert-dialog.dart';
import 'app-bar-with-text-menu.dart';
import 'bottom-nav-icon-size.dart';
import 'dialog.dart';
import 'dropdown-button-navigation.dart';
import 'expansion-tiles.dart';
import 'fab.dart';
import 'grid-view.dart';
import 'network-example.dart';
import 'posts.dart';
import 'silver-appbar-with-tabbar.dart';
import 'stack-of-cards.dart';
import 'time-tracking.dart';
import 'weather.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: ListView(
        children: pages()
            .reversed
            .toList()
            .map((page) => new Container(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(page.avatar())),
                    title: Text(page.title),
                    onTap: () => navigate(context, page.widget),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                ))
            .toList(),
      ),
    );
  }

  List<Page> pages() {
    return [
      Page("Silver AppBar With TabBar", SilverAppBarWithTabBarScreen()),
      Page("Bottom Nav Icon Size", BottomNavIconSize()),
      Page("Network Example", NetworkExampleScreen()),
      Page("Dialog Example", DialogExampleScreen()),
      Page("Weather Example", WeatherScreen()),
      Page("Alert Dialog Example", AlertDialogScreen()),
      Page("Posts", FirstFragment("", "")),
      Page("DropDown Button", DropDownButtonScreen()),
      Page("Appbar with text menu", AppBarWithTextMenuScreen()),
      Page("Card Stacks", CardStackScreen()),
      Page("FAB Example", FabExampleScreen()),
      Page("Grid Example", GridViewScreen()),
      Page("Expansion Tiles Example", ExpansionTilesExample()),
      Page("Time Tracker", TimeTrackHome(title: "Time Tracker")),
      Page("SnackBar Dialog", SnackBarDemo()),
      Page("Test State", TestStateLessScreen()),
      Page("Web View Example", WebViewScreen()),
      Page("Pull To Refresh Example", SwipeToRefreshExample()),
      Page("Location", LocationScreen()),
      Page("Login Page", LoginScreen()),
      Page("Image Picker", CameraApp()),
      Page("Routing App", RoutingApp()),
      Page("Infinite List", MyHomePage()/*LoadMoreListView(enableLoadMore: true, count: 30,)*/),
      Page("Drawer App", MyApp()),
      Page("CardsDemo App", CardsDemo()),
      Page("Walkthrough App", Welcome()),
      Page("SearchList", SearchListPage()),
      Page("Async Widget", AsyncWidget()),
      Page("Drop Down List", DropDownList()),
      Page("Nested ToolBar", NestedToolBar()),
      Page("Callback Demo", ParentWidget()),
      Page("Load Local Json", LoadLocalJson()),
      Page("Multi Form", MultiFormApp()),
      Page("Dialogs", DialogDemo()),
      Page("Show Toast", MyAppToast()),
      Page("Read Write in File", MyRWApp(storage: TextStorage())),
      Page("ToolTip",  new MaterialApp(
        home:  MyToolTipApp(),
      )),

      Page("NamePage", MaterialApp(
          title: 'Inherited Widgets Demo',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new Scaffold(
              appBar: new AppBar(
                title: new Text('Inherited Widget Example'),
              ),
              body: new NamePage()))),


      Page("Show PageView", LimeApp()),
      Page("Upload File", UploadFile()),
      Page("Segmented Control", CupertinoSegmentedControlDemo()),
      Page("Internet Connectivity", InternetConnectivity()),

      Page("Custom Clock", new MaterialApp(
        theme: new ThemeData(
          canvasColor: Colors.deepPurple,
          iconTheme: new IconThemeData(color: Colors.white),
          accentColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
        home: new MyCustomClock(),
      )),

    ];
  }
}
