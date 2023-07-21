import 'package:flutter/material.dart';
import 'package:mediabooster/views/screens/homepage.dart';
import 'package:mediabooster/views/screens/splesh_screen.dart';
import 'package:mediabooster/views/screens/videoTab.dart';

void main() {
  runApp(
    app(),
  );
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => sp_scrren(),
        'homepage': (context) => homepage(),
        'video': (context) => Video(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
