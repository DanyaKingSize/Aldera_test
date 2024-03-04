import 'package:flutter/material.dart';

import 'data_model.dart';

class ImageCard extends StatelessWidget {
  final DataModel data;

  const ImageCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery
          .sizeOf(context)
          .height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[800],
      ),
      child: Column(
        children: [
          Expanded(
            child: data.image.isNotEmpty
                ? Image.network(
              data.image,
              fit: BoxFit.contain,
            )
                : const Center(
              child: Icon(
                Icons.headphones,
                size: 50,
                color: Colors.amberAccent,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

}