import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final bool isActive;
  final void Function() onTap;

  const MyButton(
      {super.key,
      required this.name,
      required this.onTap,
      required this.isActive});// fixme comma

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isActive ?
              const Icon(
                Icons.check_rounded,// fixme to getter 'Icon get getIcon =>...'
                color: Colors.green,
              ) : const Icon(
                Icons.close,
                color: Colors.green,
              ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15,
                  ),
                )),//fixme comma
          ],
        ),
      ),
    );
  }
}
