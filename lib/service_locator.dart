import 'package:get_it/get_it.dart';
import 'package:rockify/data/repository/auth/auth_repository_impl.dart';
import 'package:rockify/data/repository/song/song_repository_impl.dart';
import 'package:rockify/data/sources/auth/auth_firebase_service.dart';

import 'package:rockify/data/sources/songs/song_firebase_service.dart';
import 'package:rockify/domain/repository/auth/auth.dart';
import 'package:rockify/domain/repository/song/song.dart';
import 'package:rockify/domain/usecases/auth/signin.dart';
import 'package:rockify/domain/usecases/auth/signup.dart';
import 'package:rockify/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance; //global instance of GetIt

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );
  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );
}
