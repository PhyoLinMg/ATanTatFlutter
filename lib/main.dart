import 'dart:convert';

import 'package:atantat_flutter/network/service.dart';
import 'package:atantat_flutter/widget/DropDown.dart';
import 'package:atantat_flutter/widget/LoginWidget.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ATanTat());

class ATanTat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController = new TextEditingController();

    return Provider(
      create: (_) => service.create(),
      dispose: (context, service service) => service.client.dispose(),
      child: MaterialApp(
        home: LoginWidget(),
      ),
    );

  }
}
  class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

      ),
    );
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


//  ListView _buildPosts(BuildContext context, List posts) {
//    return ListView.builder(
//      itemCount: posts.length,
//      padding: EdgeInsets.all(8),
//      itemBuilder: (context, index) {
//        return Card(
//          elevation: 4,
//          child: ListTile(
//            title: Text(
//              posts[index]['name'],
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//
//
//          ),
//        );
//      },
//    );
//  }



  }
