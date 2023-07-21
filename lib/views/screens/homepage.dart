import 'package:flutter/material.dart';
import 'package:mediabooster/views/screens/music_tab.dart';
import 'package:mediabooster/views/screens/videoTab.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Music & Video Player",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.black,
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 70, right: 70),
            unselectedLabelColor: Colors.grey,
            tabs: [
              const Tab(
                child: Text(
                  "Music",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Tab(
                child: Text(
                  "Video",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            Music(),
            Video(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
