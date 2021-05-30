import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class MusicRequested extends MusicEvent {
  @override
  List<Object> get props => [];
}
