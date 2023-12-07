import 'package:flutter/material.dart';
import 'package:iot_app/providers/new_drug_data.dart';
import 'package:iot_app/providers/drugs.dart';

import 'package:iot_app/screens/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewDrugData(),
        ),
        ChangeNotifierProvider(create: (context) => Drugs())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Boite à médicaments connectée'),
    );
  }
}
