import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const MyButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_rounded,
              color: Colors.green,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  name,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
