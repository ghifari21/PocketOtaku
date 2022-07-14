import 'package:flutter/material.dart';
import 'package:pocketotaku/models/ln_model.dart';
import 'package:pocketotaku/models/manga_model.dart';
import 'package:pocketotaku/models/anime_model.dart';
import 'package:pocketotaku/screens/detail_screen.dart';
import 'package:pocketotaku/widgets/content_card.dart';

class AnimeLibrary extends StatelessWidget {
  final int gridCount;
  final double _widthSize = 1.99;
  final double _heightSize = 2.94;

  AnimeLibrary({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        crossAxisCount: gridCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (_widthSize / _heightSize),
        children: animeList.map((anime) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimeScreen(anime: anime)));
            },
            child: ContentCard(
              image: anime.image,
              title: anime.title,
              rating: anime.rating,
              tag: anime.tag,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MangaLibrary extends StatelessWidget {
  final int gridCount;
  final double _widthSize = 1.99;
  final double _heightSize = 2.94;

  MangaLibrary({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        crossAxisCount: gridCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (_widthSize / _heightSize),
        children: mangaList.map((manga) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMangaScreen(manga: manga)));
            },
            child: ContentCard(
              image: manga.image,
              title: manga.title,
              rating: manga.rating,
              tag: manga.tag,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LightNovelLibrary extends StatelessWidget {
  final int gridCount;
  final double _widthSize = 1.99;
  final double _heightSize = 2.94;

  LightNovelLibrary({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        crossAxisCount: gridCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (_widthSize / _heightSize),
        children: lightNovelList.map((ln) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLightNovelScreen(lightNovel: ln)));
            },
            child: ContentCard(
              image: ln.image,
              title: ln.title,
              rating: ln.rating,
              tag: ln.tag,
            ),
          );
        }).toList(),
      ),
    );
  }
}






