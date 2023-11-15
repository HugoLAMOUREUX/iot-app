import 'package:flutter/material.dart';
import 'package:iot_app/components/tile_component.dart';
import 'package:iot_app/screens/adding_page/day_component.dart';
import 'package:iot_app/screens/adding_page/list_day.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Adding Page'),
      ),
      body: Column(children: [
        TileComponent(title: 'Jour', child: const ListDay()),
        TileComponent(
          title: 'Heure',
          child: Container(),
        ),
      ]),
    );
  }
}
