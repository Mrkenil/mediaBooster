import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediabooster/utils/global_utils.dart';
import 'package:mediabooster/views/screens/file_video_play.dart';
import 'package:mediabooster/views/screens/play_video.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ImagePicker picker = ImagePicker();
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> pickVideoFromGallery() async {
    final galleryVideo = await picker.pickVideo(source: ImageSource.gallery);
    if (galleryVideo != null) {
      String videoPath = galleryVideo.path;
      _videoController = VideoPlayerController.file(File(videoPath));
      await _videoController?.initialize();
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoController!,
          autoPlay: true,
          looping: true,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: Videolist.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Video_page(
                        Name: e['Vname'],
                        video: e['Video'],
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Card(
                    color: Colors.grey,
                    child: Container(
                      height: 200,
                      width: 330,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                            image: AssetImage(
                              e['VImage'],
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
              ),
            ).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          XFile? galleryVideo =
              await picker.pickVideo(source: ImageSource.gallery);
          if (galleryVideo != null) {
            String videoPath = galleryVideo.path;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VideoPlayerPage(videoPath: videoPath),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
    );
  }
}
