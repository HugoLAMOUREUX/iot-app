import 'package:flutter/material.dart';
import 'package:iot_app/providers/new_drug_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DayComponent extends StatefulWidget {
  String day;
  DayComponent({super.key, required this.day});

  @override
  State<DayComponent> createState() => _DayComponentState();
}

class _DayComponentState extends State<DayComponent> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = Provider.of<NewDrugData>(context, listen: false)
        .days
        .contains(widget.day);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewDrugData>(
      builder: (context, newDrugData, child) => GestureDetector(
        onTap: () {
          setState(() {
            isChecked
                ? newDrugData.removeDay(widget.day)
                : newDrugData.addDay(widget.day);
            isChecked = !isChecked;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              // liste de checkbox des jours de la semaine
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked
                              ? newDrugData.removeDay(widget.day)
                              : newDrugData.addDay(widget.day);
                          isChecked = !isChecked;
                        });
                      }),
                  Text(widget.day),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
