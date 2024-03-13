import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/home/image_card.dart';
import 'package:test_app/feature/detail/Bloc_media/video_playeer_screen.dart';
import 'data_model.dart';
import '../feature/detail/Bloc_media/detail_bloc.dart';
import '../feature/detail/Bloc_media/detail_screen.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key, required this.data});

  final List<DataModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (data[index].type == 'image') {
                        return DetailScreen(data[index]);
                      } else if (data[index].type == 'video' ||
                          data[index].type == 'audio') {
                        return BlocProvider(
                            create: (context) => DetailBloc()
                              ..add(
                                GetMediaDetailEvent(
                                  contentType: data[index].type,
                                ),
                              ),
                            child: VideoPlayerScreen(data[index]));
                      } else {
                        throw Exception('listView Error media type');
                      }
                    },
                  ),
                );
              },
              child: ImageCard(data: data[index]),
            ),
          );
        });
  }
}
