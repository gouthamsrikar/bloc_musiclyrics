import 'package:bloc_musiclyrics/models/musiclist.dart';
import 'package:bloc_musiclyrics/screens/detailscreen.dart';
import 'package:flutter/material.dart';

class Listwidget extends StatelessWidget {
  final Music article;
  Listwidget({@required this.article});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailscreen(
                  trackid: article.trackid,
                ),
              ));
        },
        child: Row(
          children: [
            Icon(Icons.music_note),
            VerticalDivider(),
            SizedBox(
              width: width / 2,
              child: Column(
                children: [
                  Text(
                    article.trackname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(article.album),
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(child: Text(article.artist)),
          ],
        ),
      ),
    );
  }
}
