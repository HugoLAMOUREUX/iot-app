import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iot_app/screens/adding_page/day_component.dart';

// ignore: must_be_immutable
class TileComponent extends StatefulWidget {
  String title;
  bool isOpen;
  Widget child;
  TileComponent(
      {super.key,
      required this.title,
      this.isOpen = false,
      required this.child});

  @override
  State<TileComponent> createState() => _TileComponentState();
}

class _TileComponentState extends State<TileComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isOpen = !widget.isOpen;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20),
                )),
                Icon(widget.isOpen
                    ? Icons.arrow_downward_outlined
                    : Icons.arrow_forward_ios),
              ],
            ),
            widget.isOpen ? widget.child : Container(),
          ],
        ),
      ),
    );
  }
}
