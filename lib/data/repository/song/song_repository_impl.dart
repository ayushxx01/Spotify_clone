import 'package:dartz/dartz.dart';

import 'package:rockify/data/sources/songs/song_firebase_service.dart';
import 'package:rockify/domain/repository/song/song.dart';
import 'package:rockify/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
