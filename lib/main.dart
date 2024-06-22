import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiking_app/location_service.dart';
import 'package:hiking_app/providers.dart';
import 'package:hiking_app/ui/trip_summary_page/main.dart';
import 'package:hiking_app/ui/trips_page.dart';
import 'package:provider/provider.dart';

import 'hiking_service.dart';

void main() {
  runApp(MultiProvider(providers: globalProviders(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TripsPage(),
      // const TripSummaryPage(),
      //
    );
  }
}
