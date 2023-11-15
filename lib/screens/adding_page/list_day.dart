import 'package:flutter/material.dart';
import 'package:iot_app/screens/adding_page/day_component.dart';

class ListDay extends StatefulWidget {
  const ListDay({super.key});

  @override
  State<ListDay> createState() => _ListDayState();
}

class _ListDayState extends State<ListDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (String day in [
          'Lundi',
          'Mardi',
          'Mercredi',
          'Jeudi',
          'Vendredi',
          'Samedi',
          'Dimanche'
        ])
          DayComponent(
            day: day,
          ),
      ],
    );
  }
}
