import 'package:flutter/material.dart';

import '../../data_model.dart';

class DetailDescription extends StatelessWidget {
  final DataModel data;

  const DetailDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        ExpansionTile(
          title: const Text(
            'Description',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          children: [
            ListTile(
              title: Text(
                data.subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Text(
          data.date,
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
          data.center,
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
          data.keyWord!.join((", ")),
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
          data.id,
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
