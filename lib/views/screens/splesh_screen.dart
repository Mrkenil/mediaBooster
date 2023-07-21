import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mediabooster/views/screens/homepage.dart';

class sp_scrren extends StatefulWidget {
  const sp_scrren({super.key});

  @override
  State<sp_scrren> createState() => _sp_scrrenState();
}

class _sp_scrrenState extends State<sp_scrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => homepage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAXqdvM6td-3OHwt3jlWQoSPK2VSCSUuvOCiy5efxJbn8fqeRadV2lmegM9Af520Y0YQ8&usqp=CAU"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
