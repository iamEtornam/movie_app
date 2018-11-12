import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example App',
      theme: new ThemeData.light(),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //get your API KEY from https://www.themoviedb.org/settings/account. Replace the xxxxxxxxxxxxx with your API KEY
  final String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=XXXXXXXXXXXXXXXXXX&language=en-US";
  List data;

  @override
  void initState() {
    this.getJsonData();
    super.initState();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['results'];
    });

    return "status: 200, message: OK";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Movies Hub'),
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Column(
                            children: <Widget>[
                              Container(
                                height: 150.0,
                                child: Image.network("https://image.tmdb.org/t/p/w500/" + data[index]['poster_path'],fit: BoxFit.fill,),
                              ),
                              Container(
                                child: Text(data[index]['title'],
                                style: TextStyle(fontSize: 16.0),),
                                padding: const EdgeInsets.all(8.0),
                              ),
                        ],
                      ),
                      elevation: 5.0,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
