import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rockify/domain/entities/song/song.dart';

class SongModel {
  final String? title;
  final String? artist;
  final num? duration;
  final Timestamp? releaseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate});

  SongModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'],
        duration = json['duration'],
        releaseDate = json['releaseDate'];
}

extension SongModelX on SongModel {
  SongEntity toEntity() => SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
      );
}
