import 'package:bloc_musiclyrics/bloc/bloc.dart';
import 'package:bloc_musiclyrics/bloc/musicevent.dart';
import 'package:bloc_musiclyrics/bloc/musicstate.dart';
import 'package:bloc_musiclyrics/models/musiclist.dart';
import 'package:bloc_musiclyrics/api/tracklistapi.dart';
import 'package:bloc_musiclyrics/widgets/listwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  static const routename = '/';

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TrackListApiService client = TrackListApiService();

  MusicBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<MusicBloc>(context);
    articleBloc.add(MusicRequested());
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF1a322b),
        ),
        body: BlocBuilder<MusicBloc, MusicState>(
          builder: (context, state) {
            if (state is MusicInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MusicLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MusicLoadSuccess) {
              //  List<Music> articles = state.musicdata;
              return ListView.builder(
                itemCount: state.musicdata.length,
                itemBuilder: (context, index) =>
                    Listwidget(article: state.musicdata[index]),
              );
            } else if (state is MusicLoadFailure) {
              return Center(
                child: Text(state.message),
              );
            }
          },
        ),
      );
    });
  }
}

//   FutureBuilder(
//   future: client.getArticle(),
//   builder: (BuildContext context, AsyncSnapshot<List<Music>> snapshot) {
//     if (snapshot.hasData) {
//       List<Music> articles = snapshot.data;
//       return ListView.builder(
//           itemCount: articles.length,
//           itemBuilder: (context, index) =>
//               Newswidget(article: articles[index]));
//     }

//     // I am connected to a mobile network.

//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   },
// ),
