import 'package:flutter/material.dart';
import 'data_model.dart';

class DetailScreen extends StatelessWidget {
  final DataModel data;

  const DetailScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(data.image),
              const SizedBox(height: 50),
              Text(
                data.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                data.subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
