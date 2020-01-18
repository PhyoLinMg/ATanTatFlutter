import 'package:atantat_flutter/widget/DropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Enter your password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: DropDown(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: DropDown(),
          ),
          
         GFButton(
            text: "Login",
            shape: GFButtonShape.pills,
          ),
        ],
      ),
    ));
  }
}