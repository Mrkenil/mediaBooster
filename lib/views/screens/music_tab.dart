import 'package:flutter/material.dart';
import 'package:mediabooster/utils/global_utils.dart';
import 'package:mediabooster/views/screens/play_music.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: MusicList.map(
            (e) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Musicpage(
                          AName: e['AName'],
                          Image: e['Image'],
                          Music: e['Music'],
                          Name: e['Mname'],
                        )));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    image: DecorationImage(
                        image: AssetImage(
                          e['Image'],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white.withOpacity(0.7),
                    size: 50,
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
