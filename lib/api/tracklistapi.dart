import 'dart:convert';
import 'package:bloc_musiclyrics/models/musicdetails.dart';
import 'package:bloc_musiclyrics/models/musiclist.dart';
import 'package:http/http.dart';

class TrackListApiService {
  final endPointUrl =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";

  Future<List<Music>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      Map<String, dynamic> body = json['message']['body'];
      List<dynamic> body1 = body['track_list'];

      List<Music> articles =
          body1.map((dynamic item) => Music.fromJson(item)).toList();
      // print(articles);
      return articles;
    } else {
      throw ("Can't get the tracks");
    }
  }

  Future<Musicdetail> getdetail(String trackid) async {
    final detailurl =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackid&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    final lyricurl =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackid&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7";
    Response res1 = await get(Uri.parse(detailurl));
    Response res2 = await get(Uri.parse(lyricurl));

    if (res1.statusCode == 200 && res2.statusCode == 200) {
      Map<String, dynamic> detailjson = jsonDecode(res1.body);
      Map<String, dynamic> lyricjson = jsonDecode(res2.body);

      Map<String, dynamic> detailjsonbody =
          detailjson['message']['body']['track'];
      print(detailjsonbody);
      detailjsonbody['lyrics'] =
          lyricjson['message']['body']['lyrics']['lyrics_body'];

      Musicdetail details = Musicdetail(
        explicit: detailjsonbody['explicit'].toString(),
        trackname: detailjsonbody['track_name'].toString(),
        album: detailjsonbody['album_name'].toString(),
        artist: detailjsonbody['artist_name'].toString(),
        rating: detailjsonbody['track_rating'].toString(),
        lyrics: detailjsonbody['lyrics'].toString(),
      );

      return details;
    } else {
      throw ("Can't get the details");
    }
  }
}
