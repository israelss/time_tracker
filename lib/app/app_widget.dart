import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_modular/flutter_modular.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      navigatorObservers: [routeObserver],
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
