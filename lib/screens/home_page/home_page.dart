import 'package:flutter/material.dart';
import 'package:iot_app/screens/adding_page/adding_page.dart';
import 'package:iot_app/screens/settings_page/settings_page.dart';
import 'package:provider/provider.dart';

import '../../providers/drugs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // navigate to settings page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          )
        ],
      ),
      body: //all the drugs displayed in a list
          Center(
        child: Consumer<Drugs>(
          builder: (context, drugs, child) => Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Liste des médicaments',
                    style: TextStyle(fontSize: 20)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: drugs.drugs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                        title: Text(
                          drugs.drugs[index].name,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${drugs.drugs[index].days} à ${drugs.drugs[index].hour}:${drugs.drugs[index].minute}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate to adding page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddingPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
