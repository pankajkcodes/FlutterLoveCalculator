import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final yourName = TextEditingController();
  final partnerName = TextEditingController();
  int? lovepercentage;
  var darkmode = false;

  void calculateLove() {
    if (yourName.text.isEmpty || partnerName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fill All Fields')),
      );
      return;
    }
    setState(() {
      lovepercentage = (Random().nextInt(100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: darkmode? Brightness.dark : Brightness.light,
          textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 23,color: Colors.redAccent),)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Love Calcultor"),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (lovepercentage != null)
                Text(
                  "${yourName.text} loves ${partnerName.text} $lovepercentage %",
                ),
              TextField(
                controller: yourName,
                decoration: const InputDecoration(
                  hintText: "Your Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: partnerName,
                decoration: const InputDecoration(
                  hintText: "Partner Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10)),
                onPressed: () {
                  calculateLove();
                },
                label: const Text(
                  "Calculate Love",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                icon: const Icon(Icons.favorite),
              ),
              const SizedBox(
                height: 20,
              ),
              Switch(
                  value: darkmode,
                  onChanged: (value) {
                    setState(() {
                      darkmode = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
