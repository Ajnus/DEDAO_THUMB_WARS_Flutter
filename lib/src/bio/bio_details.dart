import 'package:flutter/material.dart';
import 'CharBio.dart';

class DetailsBio extends StatefulWidget {
  final CharBio _charBio;
  DetailsBio(this._charBio);

  @override
  _DetailsBioState createState() => _DetailsBioState();
}

class _DetailsBioState extends State<DetailsBio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Biography',
              style: new TextStyle(
                fontSize: 24.0,
                fontFamily: 'StarJedi',
                color: new Color(0xFF26C6DA),
              ))),
      body: buildBio(),
    );
  }

  Widget buildBio() {
    return Container(
        color: Color(0xFF555555),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.blueAccent,
                    backgroundImage: NetworkImage("${widget._charBio.pic}"),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "${widget._charBio.name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Altura:" + " ${widget._charBio.height}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Peso:" + " ${widget._charBio.mass}",
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ))
              ],
            )
          ],
        ));
  }
}
