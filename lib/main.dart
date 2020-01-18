import 'dart:convert';

import 'package:atantat_flutter/network/service.dart';
import 'package:atantat_flutter/widget/DropDown.dart';
import 'dart:developer' as developer;
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:provider/provider.dart';

void main() => runApp(ATanTat());

class ATanTat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The initialized PostApiService is now available down the widget tree
      create: (_) => service.create(),
      // Always call dispose on the ChopperClient to release resources
      dispose: (context, service service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
  class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // onPressed: () async {
        //   // The JSONPlaceholder API always responds with whatever was passed in the POST request
        //   final response = await Provider.of<service>(context)
        //       .getMajor();
        //   // We cannot really add any new posts using the placeholder API,
        //   // so just print the response to the console
        //   print(response.body);
        // },
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

            return _buildPosts(context,major);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            
          ),
        );
      },
    );
  }



  }
