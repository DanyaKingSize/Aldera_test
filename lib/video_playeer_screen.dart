import 'package:flutter/material.dart';
import 'data_model.dart';
import 'package:media_kit/media_kit.dart';

import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerScreen extends StatefulWidget {
  final DataModel data;

  const VideoPlayerScreen(this.data, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final controller = VideoController(player);
  late final player = Player();

  @override
  void initState() {
    super.initState();
    // Play a [Media] or [Playlist].
    player.open(Media(
        'http://images-assets.nasa.gov/video/GSFC_20181129_FERMI_m13104_Starlight/GSFC_20181129_FERMI_m13104_Starlight~mobile.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
        iconTheme: const IconThemeData(
          color: Colors.yellow,
          size: 30,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9.0 / 16.0,
          // Use [Video] widget to display video output.
          child: Video(controller: controller),
        ),
      ),
    );
  }
}
