import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, Object> value;

  DetailsPage({Key key, this.value}) : super(key: key);

  @override
  DetailsPageState createState() {
    return new DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  bool _alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        actions: <Widget>[
          IconButton(
//            icon: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border,
//            color: _alreadySaved ? Colors.red : null,
//            ),
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Hello!'),
              ));
            },

          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                    "${widget.value['backdrop_path']}"),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: RichText(
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        text: '${widget.value['title']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 8.0),
                    child: Text(
                      "${widget.value['overview']}",
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 12.0,
                              ),
                              Text("${widget.value['release_date']}",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text("${widget.value['vote_average']}",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  )),
                              Icon(
                                Icons.stars,
                                size: 12.0,
                              ),
                            ],
                          ),
//                          new Text("${widget.value['release_date']}"),
//                          new Text("${widget.value['vote_average']}"),
                        ]),
                  ),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*void _showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}*/
