import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  final ValueNotifier<RangeValues> value; //fixme Прокинуть в слайдер

  const MySlider({super.key, required this.value
      //required this.onChanged

      });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  RangeValues values = const RangeValues(1920, 2024);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.round().toString(),
      values.end.round().toString(),
    );
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(186, 186, 186, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'From ${values.start.round()} ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: const Color.fromRGBO(186, 186, 186, 1),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(186, 186, 186, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'To ${values.end.round()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RangeSlider(
              values: values,
              min: 1920,
              max: 2024,
              divisions: 124,
              labels: labels,
              //activeColor: const Color.fromRGBO(29, 54, 127, 1),
              activeColor: Colors.yellow,
              onChanged: (newValues) {
                setState(() => values = newValues);
              },
            ),
          ],
        ),
      ),
    );
  }
}
