import 'dart:async';
import 'dart:developer' as developer;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:application_enviproduct_v01/src/utils/main_menu.dart';
import 'package:application_enviproduct_v01/src/widgets/tablero_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final List<String> _options = ["Menú", "Paradas", "Entregas"];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final PageStorageBucket _bucket = PageStorageBucket();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
              leading: const Icon(Icons.settings),
              title: const Text("Ajustes"),
            )
          ],
        )),
        appBar: AppBar(
            centerTitle: true,
            title: Text('Enviproducts - ' + _options[_currentIndex])),
        body: _connectionStatus == ConnectivityResult.none
            ? TableroWidget(
                titulo: MenuItem("No hay internet", Icons.cloud_off),
                descripcion: "Verifique la conexión")
            : PageStorage(
                bucket: _bucket, child: contentWidgets[_currentIndex]),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60.0,
          color: Colors.green,
          backgroundColor: Colors.white10,
          animationCurve: Curves.easeInOut,
          buttonBackgroundColor: Colors.green,
          items: const <Widget>[
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.map_outlined, size: 30, color: Colors.white),
            Icon(Icons.location_on_outlined, size: 30, color: Colors.white),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ));
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }
}
