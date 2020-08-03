import 'package:flutter/material.dart';
import 'package:practica_provider/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  TextEditingController txtUserController = TextEditingController();
  TextEditingController txtPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    final userProvider = Provider.of<UserProvider>(context);

    final logo = CircleAvatar(
      //backgroundColor: Colors.lightGreen,
      radius: 48.0,
      child: Image.network("https://cdn1.iconfinder.com/data/icons/unigrid-bluetone-human-vol-1/60/011_001_user_profile_avatar_man_boy_round-512.png"),
    );

    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
      decoration: InputDecoration(
        hintText: 'Introduce el usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final txtPwd = TextFormField(
      controller: txtPwdController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if( txtUserController.text.isNotEmpty && txtPwdController.text.isNotEmpty ){
            userProvider.user = txtUserController.text;
            Navigator.pushNamed(context, '/regards');
          }else{
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Mensaje de la APP"),
                  content: Text("Error en las credenciales introducidas"),
                  actions: <Widget>[
                    new FlatButton(
                      child: Text("Cerrar"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            ); 
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            txtEmail,
            SizedBox(height: 30.0),
            txtPwd,
            SizedBox(height: 30.0),
            loginButton
          ],
        ),
      ),
    );
  }
}