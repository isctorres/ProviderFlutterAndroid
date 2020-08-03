import 'package:flutter/material.dart';
import 'package:practica_provider/src/providers/user_provider.dart';
import 'package:practica_provider/src/screen/login.dart';
import 'package:practica_provider/src/screen/regards.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        routes: {
          '/regards' : (context) => Regards()
        },
        title: 'Material App',
        home: Login()
      ),
      create: (context) => UserProvider(),
    );
  }
}