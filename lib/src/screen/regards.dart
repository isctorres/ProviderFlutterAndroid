import 'package:flutter/material.dart';
import 'package:practica_provider/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Regards extends StatelessWidget {
  const Regards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido :)')),
      body: Center(
        child: Text('Bienvenido usuario ${userProvider.user}', style: TextStyle(fontSize: 18.0),),
      ),
    );
  }
}