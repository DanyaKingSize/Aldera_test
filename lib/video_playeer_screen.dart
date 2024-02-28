import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'data_model.dart';


class VideoPlayerScreen extends StatefulWidget {
  final DataModel data;

  // final Repository _repository;

  const VideoPlayerScreen(this.data, {super.key});

  // const VideoPlayerScreen(this.data, this._repository, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final controller = VideoController(player);
  late final player = Player();

  Future<String> getVideoLink() async {
    // return  widget._repository.getVideoLink(nasaId: widget.data.id);
    return '';
  }

  @override
  void initState() {
    super.initState();

    player.open(Media(widget.data.videoLink));
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
