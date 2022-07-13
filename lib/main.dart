import 'package:flutter/material.dart';
import 'package:android_tethering_tx_rx_app/Widget/show_ip_state_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );

  }

}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

enum Menu {searchDevice, thisDeviceIP, other}

class _MyHomePageState extends State<MyHomePage> {

  ShowIPState instance = ShowIPState();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: PopupMenuButton(
        onSelected: popupMenuSelected,
        itemBuilder: (BuildContext context) =>
        <PopupMenuEntry<Menu>> [
          const PopupMenuItem(value: Menu.searchDevice, child: ListTile(leading: Icon(Icons.supervisor_account),
          title: Text("aaa"))),
          const PopupMenuItem(value: Menu.thisDeviceIP,child: ListTile(leading: Icon(Icons.crop_original),
          title: Text("bbb"))),
          const PopupMenuItem(value: Menu.other,child: ListTile(leading: Icon(Icons.wallet),
              title: Text("ccc"))),
        ],
      ),
    );
  }
  void popupMenuSelected(Menu selectedMenu) {
    switch(selectedMenu) {

      case Menu.searchDevice:
        _pushPage(context, instance.build(context));
        break;

      case Menu.thisDeviceIP:
        // TODO: Handle this case.
        break;

      case Menu.other:
        // TODO: Handle this case.
        break;
    }
  }

  void _pushPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page)
    );
  }
}


