import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:test_app/feature/detail/Bloc_media/detail_description.dart';
import '../../../home/data_model.dart';
import 'detail_bloc.dart';
//import 'package:audioplayers/audioplayers.dart';

class VideoPlayerScreen extends StatefulWidget {
  final DataModel data;

  const VideoPlayerScreen(this.data, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final controller = VideoController(videoPlayer);
  late final videoPlayer = Player();
  //late final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    videoPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        if (state is SuccessMediaDetailState) {
          switch (state.contentType) {
            case 'video':
              videoPlayer.open(Media(widget.data.mediaLink));
            case 'audio':
              //audioPlayer.play(UrlSource(widget.data.mediaLink));
            videoPlayer.open(Media(widget.data.mediaLink));
            default:
              throw Exception('Error type in Media Player');
          }
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
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.width * 8.0 / 16.0,
                          child: BlocBuilder<DetailBloc, DetailState>(
                            builder: (context, state) {
                              return Video(
                                controller: controller,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    DetailDescription(data: widget.data),
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
