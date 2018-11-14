import 'dart:async';
import 'dart:convert';

import 'package:example_app/pages/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get your API KEY from https://www.themoviedb.org/settings/account. Replace the xxxxxxxxxxxxx with your API KEY
  final String url =
      "https://api.themoviedb.org/3/movie/popular?api_key=XXXXXXXXXXXXXX&language=en-US";

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
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.builder(
            itemCount: data == null ? 0 : data.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                        data[index]['poster_path']),
                    fit: BoxFit.fill,
                  )),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(value: data[index]),
                      ));
                },
              );
            });
      }),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: const Color(0xFFe65936),
          child: new Icon(Icons.favorite),
          onPressed: () {}),
    );
  }
}
