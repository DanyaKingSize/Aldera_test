import 'package:flutter/material.dart';
import 'package:test_app/home/filters/my_bottom_sheet.dart';
import 'package:test_app/home/filters/slider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  void getFilterData() {}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Filters',
        style: TextStyle(color: Colors.deepPurple, fontSize: 15),
      ),
      onPressed: () {
        ValueNotifier<RangeValues> value = ValueNotifier<RangeValues>(const RangeValues(1920,2024));
        showModalBottomSheet(
          context: context,
          backgroundColor: const Color.fromRGBO(34, 35, 41, 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          builder: (BuildContext context) {
            return MyBottomSheet(value);
          },
        ).whenComplete(() {
          debugPrint('AAAAAAA$value');

        });
      },
    );
  }
}
