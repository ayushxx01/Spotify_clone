import 'package:dartz/dartz.dart';
import 'package:rockify/core/usecases/usecase.dart';
import 'package:rockify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewsSongs();
  }
}
