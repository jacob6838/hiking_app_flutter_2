import 'package:flutter/material.dart';
import 'package:hiking_app/secure_storage_service.dart';
import 'package:kt_dart/collection.dart';
import '../../models/units.dart';
import 'metrics_table_units.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SecureStorageService storageService = SecureStorageService();
  KtMap<String, Unit> units = const KtMap<String, Unit>.empty();

  @override
  initState() async {
    super.initState();

    await storageService.init();
    units = await storageService.retrieveUnits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Hello, Hiker!'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Trips'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
            child: Column(children: <Widget>[
          MetricsUnitTable(units),
          OutlinedButton(child: const Text("Save"), onPressed: () {})
        ])));
  }

  void handleClick(String value) {
    switch (value) {
      case 'Trips':
        Navigator.pop(context);
        break;
    }
  }
}
