import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home/filters/slider.dart';

class MyBottomSheet extends StatelessWidget {
  final ValueNotifier<RangeValues> value;

  const MyBottomSheet(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // fixme move bottom sheet in separated widget
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filters',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: const Text(
                    'Reset all filters',
                    style: TextStyle(
                        color: Color.fromRGBO(186, 186, 186, 1),
                        fontSize: 14), //fixme comma
                  ),
                ),
              ),
            ],
          ),
          const Divider(
              height: 2, color: Color.fromRGBO(233, 233, 233, 1)), //fixme comma
          const SizedBox(
            height: 24, //fixme useless comma
          ),
          const Text(
            'Select the time period to search',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          MySlider(value: value,),

          const Divider(
            height: 2,
            color: Color.fromRGBO(233, 233, 233, 1),
          ), //fixme comma
        ],
      ),
    );
  }
}
