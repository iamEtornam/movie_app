import 'package:example_app/model/movie.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  Movie movie;


  DetailsPage(this.movie);

  @override
  DetailsPageState createState() {
    return new DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.movie.title}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500" +
                          widget.movie.backdrop_path),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(widget.movie.title)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

