import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockify/core/configs/constants/app_urls.dart';
import 'package:rockify/domain/entities/song/song.dart';
import 'package:rockify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:rockify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
              builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is NewsSongsLoaded) {
              // Display a container with text indicating data is received
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    child: Text(
                      'Data received: ${state.songs.length} songs loaded',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: _songs(state.songs)),
                ],
              );
            }
            return Container();
          })),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final imageUrl =
              '${AppURLs.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpg${AppURLs.mediaAlt}';

          return SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 14);
        },
        itemCount: songs.length);
  }
}
