class Music {
  String trackname;
  String album;
  String artist;
  String trackid;

  Music({
    this.trackid,
    this.trackname,
    this.album,
    this.artist,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      trackid: json['track']['track_id'].toString(),
      trackname: json['track']['track_name'].toString(),
      album: json['track']['album_name'].toString(),
      artist: json['track']['artist_name'].toString(),
    );
  }
}
