import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'data_model.dart';
import 'feature/detail/detail_bloc.dart';
//import 'package:audioplayers/audioplayers.dart';

class VideoPlayerScreen extends StatefulWidget {
  final DataModel data;

  const VideoPlayerScreen(this.data, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final controller = VideoController(player);
  late final player = Player();
  //final audioplayer = AudioPlayer();

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
        if (state is SuccessDetailState) {
          // player.open(Media(state.sourceLink));
          player.open(Media(widget.data.mediaLink));
        }
        if (state is SuccessAudioDetailState) {
          player.open(Media(widget.data.mediaLink));
          //audioplayer.play(UrlSource(widget.data.mediaLink));
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
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 8.0 / 16.0,
                        child: BlocBuilder<DetailBloc, DetailState>(
                          builder: (context, state) {
                            return Video(controller: controller);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    Text(
                      widget.data.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.data.subTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.data.date,
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Center:',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.data.center,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Key words:',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.data.keyWord!.join((", ")),
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'NASA ID: ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.data.id,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


/*
 body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 9.0 / 16.0,
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  return Video(controller: controller);
                },
              ),
            ),
          ),
 */