import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'data_model.dart';
import 'feature/detail/detail_bloc.dart';


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
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        if (state is SuccessDetailState){
          player.open(Media('http://images-assets.nasa.gov/audio/Ep115_Air to Space/Ep115_Air to Space~128k.mp3'));
        }
      },
      builder: (context, state) {
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 9.0 / 16.0,
              // Use [Video] widget to display video output.
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  return Video(controller: controller);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
