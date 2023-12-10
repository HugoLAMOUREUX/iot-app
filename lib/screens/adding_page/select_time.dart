import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:iot_app/providers/new_drug_data.dart';
import 'package:provider/provider.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();

    _dateTime = Provider.of<NewDrugData>(context, listen: false).time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hourMinute15Interval(context),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          child: Text(
            '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget hourMinute15Interval(BuildContext context) {
    return Consumer<NewDrugData>(
      builder: (context, newDrugData, child) => TimePickerSpinner(
        spacing: 40,
        minutesInterval: 1,
        time: _dateTime,
        normalTextStyle: const TextStyle(fontSize: 20),
        highlightedTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        onTimeChange: (time) {
          setState(() {
            _dateTime = time;
            newDrugData.time = _dateTime;
          });
        },
      ),
    );
  }
}
