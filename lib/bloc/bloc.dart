import 'package:bloc_musiclyrics/api/tracklistapi.dart';
import 'package:bloc_musiclyrics/bloc/musicevent.dart';
import 'package:bloc_musiclyrics/bloc/musicstate.dart';
import 'package:bloc_musiclyrics/models/musiclist.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final TrackListApiService client;

  MusicBloc({@required this.client})
      : assert(client != null),
        super(null);

  @override
  Stream<MusicState> mapEventToState(MusicEvent event) async* {
    if (event is MusicRequested) {
      yield MusicLoadInProgress();
      try {
        List<Music> music1 = await client.getArticle();

        yield MusicLoadSuccess(musicdata: music1);
      } catch (error) {
        yield MusicLoadFailure(message: error.toString());
      }
    }
  }
}
