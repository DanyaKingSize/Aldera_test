import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data_model.dart';
import 'package:test_app/feature/detail/detail_bloc.dart';
import 'package:test_app/repository.dart';
import 'package:test_app/video_playeer_screen.dart';
import 'feature/detail/detail_screen.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key, required this.data});

  final List<DataModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: data.length,
      itemBuilder: (context, index) {
        debugPrint(data[index].image);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    if (data[index].type == 'image') {
                      return DetailScreen(data[index]);
                    } else if (data[index].type == 'video') {
                      return BlocProvider(
                          create: (context) => DetailBloc(
                                context.read<Repository>(),
                              )..add(
                                  GetLinkDetailEvent(data[index].id),
                                ),
                          child: VideoPlayerScreen(data[index]));
                    } else {
                      throw Exception('listView Error media type');
                    }
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[800],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: data[index].image.isNotEmpty
                        ? Image.network(
                            data[index].image,
                            fit: BoxFit.contain,
                          )
                        : const Center(
                            child: Icon(Icons.headphones,
                              size: 50,
                              color: Colors.amberAccent,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
