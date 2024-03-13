
import 'package:flutter/material.dart';
import 'package:test_app/home/filters/slider.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Filters',
        style: TextStyle(color: Colors.deepPurple, fontSize: 15),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: const Color.fromRGBO(34, 35, 41, 1),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            builder: (BuildContext context) {
              return Padding(
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
                                  fontSize: 14),
                            )
                            ,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                        height: 2, color: Color.fromRGBO(233, 233, 233, 1)),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Select the time period to search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const MySlider(),
                    const Divider(
                        height: 2, color: Color.fromRGBO(233, 233, 233, 1)),
                  ],
                ),
              );
            });
      },
    );
  }
}
