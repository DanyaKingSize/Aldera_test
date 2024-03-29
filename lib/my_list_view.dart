import 'package:flutter/material.dart';
import 'package:test_app/data_model.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'detail_screen.dart';

enum contentType { image, video, audio }

class MyListView extends StatelessWidget {
  const MyListView({super.key, required this.data});

  final List<DataModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(data[index]),
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
                    child: Image.network(
                      data[index].image,
                      fit: BoxFit.contain,
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
