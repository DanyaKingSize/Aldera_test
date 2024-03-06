import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/home/Slider.dart';


class MyBottomSheet extends StatelessWidget{
  const MyBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
        child: const Text('Filter by year',
   style: TextStyle(
     color: Colors.deepPurple,
     fontSize: 15
   ),
          
   ),
     onPressed: (){
          showModalBottomSheet(
              context: context,
              backgroundColor: const Color.fromRGBO(34, 35, 41, 1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
              builder: (BuildContext context){
                return Container(
                  height: 300,
                  child: const MySlider(),
                  );
              }
          );
     },
   );
  }

}

/*
Future displayBottomSheet(BuildContext context){
  return showModalBottomSheet(context: context,
      shape: const RoundedRectangleBorder(borderRadius:BorderRadius.vertical(top:Radius.circular(40)) ),
      builder:(context)=> Container(
        height: 200,
        color: Colors.yellow,
      )
  );
}

 */