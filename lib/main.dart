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
      theme: new ThemeData.dark(),
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
      "https://api.themoviedb.org/3/movie/popular?api_key=XXXXXXXXXXXXXXXXXXX&language=en-US";

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
      body: GridView.builder(
          itemCount: data == null ? 0 : data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5.0),
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: IntrinsicHeight(
                child: GestureDetector(
                  child: Card(
                    elevation: 2.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500" +
                                            data[index]['poster_path'])
                                )
                            ),
                          ),
                          Container(
                            child: Text(
                              data[index]['title'],
                              style: TextStyle(fontSize: 14.0),
                            ),
                            margin: EdgeInsets.all(5.0),
                          ),
                        ],
                      ),
                  ),
                  onTap: () {},
                ),
              ),
            );
          }),
    );
  }
}
