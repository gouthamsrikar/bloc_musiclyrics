import 'package:bloc_musiclyrics/models/musiclist.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoadInProgress extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoadSuccess extends MusicState {
  final List<Music> musicdata;

  const MusicLoadSuccess({@required this.musicdata});

  @override
  List<Object> get props => null;
}

class MusicLoadFailure extends MusicState {
  final String message;

  MusicLoadFailure({@required this.message});

  @override
  List<Object> get props => [];
}
