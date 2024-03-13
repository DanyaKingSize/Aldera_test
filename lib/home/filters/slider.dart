import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

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

                    width: 134.09,
                    height: 42,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(186, 186, 186, 1),
                      ),
                    ),
                    child:  Center(
                      child: Text(
                        'From ${values.start.round()} ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 2,
                    color: const Color.fromRGBO(186, 186, 186, 1),
                  ),
                  Container(
                    width: 134.09,
                    height: 42,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(186, 186, 186, 1),
                      ),
                    ),
                    child:  Center(
                      child: Text(
                        'From ${values.end.round()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
        const SizedBox(
          height: 10,
        ),
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

            }),
        ],
      ),
    ),);
  }
}
