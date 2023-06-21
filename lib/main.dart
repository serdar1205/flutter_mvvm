import 'package:flutter/material.dart';
import 'package:flutter_mvvm/provider/currencies_provider.dart';
import 'package:flutter_mvvm/views/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => CurrenciesProvider())),
    ],
    child: const MyApp(),
  ), );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

