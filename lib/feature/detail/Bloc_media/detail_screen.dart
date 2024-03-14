import 'package:flutter/material.dart';
import 'package:test_app/feature/detail/bloc_media/detail_description.dart';
import '../../../home/data_model.dart';

class DetailScreen extends StatelessWidget {
  final DataModel data;

  const DetailScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(data.mediaLink);
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
                const SizedBox(height: 15),
                Image.network(data.image),
                const SizedBox(height: 15),
                DetailDescription(data: data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
