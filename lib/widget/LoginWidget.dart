import 'dart:convert';

import 'package:atantat_flutter/widget/DropDown.dart';
import 'package:chopper/chopper.dart';
import 'package:atantat_flutter/network/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';

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
            child: _buildBody(context),
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
FutureBuilder<Response> _buildBody(BuildContext context) {
  // FutureBuilder is perfect for easily building UI when awaiting a Future
  // Response is the type currently returned by all the methods of PostApiService
  return FutureBuilder<Response>(
    // In real apps, use some sort of state management (BLoC is cool)
    // to prevent duplicate requests when the UI rebuilds
    future: Provider.of<service>(context).getMajor(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        // Snapshot's data is the Response
        // You can see there's no type safety here (only List<dynamic>)

        var majors=json.decode(snapshot.data.bodyString);
        var testing=majors["data"];
        final List major=testing;
        List<String> gg=[];
        for(var i=0;i<major.length;i++){
          gg.add(major[i]["name"]);
        }
        return DropDown(gg);

      } else {
        // Show a loading indicator while waiting for the posts
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}