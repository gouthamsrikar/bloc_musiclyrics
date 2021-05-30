import 'package:bloc_musiclyrics/models/musicdetails.dart';

import 'package:bloc_musiclyrics/api/tracklistapi.dart';

import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  static const routename = '/12';
  final String trackid;
  Detailscreen({this.trackid});

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  TrackListApiService client = TrackListApiService();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1a322b),
      ),
      body: FutureBuilder(
        future: client.getdetail(widget.trackid),
        builder: (BuildContext context, AsyncSnapshot<Musicdetail> snapshot) {
          if (snapshot.hasData) {
            print(true);
            Musicdetail article = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Name :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(article.trackname),
                    Text(
                      'Track Album :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(article.album),
                    Text(
                      'Artist :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(article.artist),
                    Text(
                      'Rating :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(article.rating),
                    Text(
                      'Lyrics :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(article.lyrics),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
