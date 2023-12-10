import 'package:flutter/material.dart';
import 'package:iot_app/providers/new_drug_data.dart';
import 'package:iot_app/screens/adding_page/adding_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _controller = TextEditingController();

  // change coma to dot
  String changeComaToDot(String ipAddress) {
    final List<String> ipAddressSplitted = ipAddress.split('');
    for (int i = 0; i < ipAddressSplitted.length; i++) {
      if (ipAddressSplitted[i] == ',') {
        ipAddressSplitted[i] = '.';
      }
    }
    return ipAddressSplitted.join();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('ipAddress') != null) {
        if (mounted) {
          Provider.of<NewDrugData>(context, listen: false).ipAddress =
              prefs.getString('ipAddress')!;
        }
      }
    });

    if (mounted) {
      _controller.text =
          Provider.of<NewDrugData>(context, listen: false).ipAddress;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Paramètres'),
      ),
      body: // zone de texte pour l'adresse IP du broker MQTT
          Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Consumer<NewDrugData>(
              builder: (context, newDrugData, child) => TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Adresse IP broker MQTT',
                  labelText:
                      'Adresse IP broker MQTT', // Add this line for the floating label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                onChanged: (value) {
                  value = changeComaToDot(value);
                  _controller.text = value;
                  newDrugData.ipAddress = value.trim();
                },
                onEditingComplete: () {
                  changeComaToDot(_controller.text.trim());
                  newDrugData.ipAddress = _controller.text.trim();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Consumer<NewDrugData>(
              builder: (context, newDrugData, child) => TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  disabledForegroundColor: Colors.grey,
                ),
                onPressed: () {
                  newDrugData.initializeClient();
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setString('ipAddress', newDrugData.ipAddress);
                  });
                  FocusScope.of(context).unfocus();
                },
                child: const Text('Valider'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          // navigate to adding page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddingPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
