import 'package:flutter/material.dart';
import 'package:iot_app/components/tile_component.dart';
import 'package:iot_app/providers/new_drug_data.dart';
import 'package:iot_app/screens/adding_page/list_day.dart';
import 'package:iot_app/screens/adding_page/select_time.dart';
import 'package:provider/provider.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ajouter un médicament'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // zone de texte pour le nom du médicament
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Consumer<NewDrugData>(
                builder: (context, newDrugData, child) => TextField(
                  controller: _controller,
                  onChanged: (value) {
                    newDrugData.name = value.trim();
                  },
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    labelText: 'Nom', // Add this line for the floating label
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
                ),
              ),
            ),

            // liste de checkbox des jours de la semaine
            TileComponent(title: 'Jour', child: const ListDay()),

            // choix de l'heure de prise du médicament
            TileComponent(
              title: 'Heure',
              child: const SelectTime(),
            ),

            // bouton de validation pour envoyer les données
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Consumer<NewDrugData>(
                builder: (context, newDrugData, child) => ElevatedButton(
                  onPressed: () {
                    if (newDrugData.days.isNotEmpty && newDrugData.name != '') {
                      newDrugData.sendData();
                      Navigator.pop(context);
                    }
                    // ajouter le médicament à la liste
                    // Provider.of<NewDrugData>(context, listen: false).addDrug();
                    // retourner à la page d'accueil
                  },
                  child: const Text('Ajouter'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
