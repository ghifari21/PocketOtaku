import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketotaku/models/anime_model.dart';
import 'package:pocketotaku/models/ln_model.dart';
import 'package:pocketotaku/models/manga_model.dart';
import 'package:pocketotaku/widgets/content_card.dart';
import 'package:pocketotaku/widgets/favorite_button.dart';

var mobileHeaderStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFEF7369),
  ),
);

var mobileContentStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 12.0,
    color: Colors.black,
  ),
);

var webHeaderStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFFEF7369),
  ),
);

var webContentStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  )
);

class DetailMangaScreen extends StatelessWidget {
  final Manga manga;

  DetailMangaScreen({required this.manga});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileDetailMangaScreen(manga: manga);
        } else {
          return WebsiteDetailMangaScreen(manga: manga);
        }
      },
    );
  }
}

class MobileDetailMangaScreen extends StatelessWidget {
  final Manga manga;

  MobileDetailMangaScreen({required this.manga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 20.0
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: manga.tag,
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: AssetImage(manga.image),
                        )
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xFFFCD7DF),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                manga.image,
                                height: 150,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SelectableText(
                                    manga.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SelectableText(
                                      'Author: ${manga.author}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ),
                                  SelectableText(
                                    'Artist: ${manga.artist}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                manga.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              manga.status,
                                              style: const TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                manga.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FavoriteButton(),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.share,
                                  color: Color(0xFFFCD7DF),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 25.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Synopsis',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SelectableText(
                manga.synopsis,
                textAlign: TextAlign.left,
                style: mobileContentStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Information',
                          textAlign: TextAlign.left,
                          style: mobileHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  SelectableText(
                    'Volume: ${manga.volume.toString()} Volumes',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Chapter: ${manga.chapter.toString()} Chapters',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Published: ${manga.published}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Demographic: ${manga.demographic}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Genres: ${manga.genres}',
                    style: mobileContentStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Recommendations',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 293,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mangaList.length,
                itemBuilder: (BuildContext context, int i) {
                  if (manga.title != mangaList[i].title) {
                    return SizedBox(
                      width: 185,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMangaScreen(manga: mangaList[i])));
                        },
                        child: ContentCard(
                          image: mangaList[i].image,
                          title: mangaList[i].title,
                          rating: mangaList[i].rating,
                          tag: mangaList[i].tag
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebsiteDetailMangaScreen extends StatefulWidget {
  final Manga manga;

  WebsiteDetailMangaScreen({required this.manga});

  @override
  State<WebsiteDetailMangaScreen> createState() => _WebsiteDetailMangaScreenState(manga: manga);
}

class _WebsiteDetailMangaScreenState extends State<WebsiteDetailMangaScreen> {
  final Manga manga;
  final _scrollController = ScrollController();

  _WebsiteDetailMangaScreenState({required this.manga});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 20.0
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: manga.tag,
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage(manga.image),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    color: const Color(0xFFFCD7DF),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Image.asset(
                                    manga.image,
                                    height: 250,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      SelectableText(
                                        manga.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: SelectableText(
                                          'Author: ${manga.author}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0
                                          ),
                                        ),
                                      ),
                                      SelectableText(
                                        'Artist: ${manga.artist}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                manga.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                            Text(
                                              manga.status,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Text(
                                                manga.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FavoriteButton(),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.share,
                                    color: Color(0xFFFCD7DF),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Synopsis',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SelectableText(
                    manga.synopsis,
                    textAlign: TextAlign.left,
                    style: webContentStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Information',
                              textAlign: TextAlign.left,
                              style: webHeaderStyle,
                            ),
                          ],
                        ),
                      ),
                      SelectableText(
                        'Volume: ${manga.volume.toString()} Volumes',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Chapter: ${manga.chapter.toString()} Chapters',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Published: ${manga.published}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Demographic: ${manga.demographic}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Genres: ${manga.genres}',
                        style: webContentStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Recommendations',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 293,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.trackpad
                    }),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mangaList.length,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int i) {
                        if (manga.title != mangaList[i].title) {
                          return SizedBox(
                            width: 185,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMangaScreen(manga: mangaList[i])));
                              },
                              child: ContentCard(
                                image: mangaList[i].image,
                                title: mangaList[i].title,
                                rating: mangaList[i].rating,
                                tag: mangaList[i].tag
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailAnimeScreen extends StatelessWidget {
  final Anime anime;

  DetailAnimeScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileDetailAnimeScreen(anime: anime);
        } else {
          return WebsiteDetailAnimeScreen(anime: anime);
        }
      },
    );
  }
}

class MobileDetailAnimeScreen extends StatelessWidget {
  final Anime anime;

  MobileDetailAnimeScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 20.0
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: anime.tag,
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: AssetImage(anime.image),
                        )
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xFFFCD7DF),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                anime.image,
                                height: 150,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SelectableText(
                                    anime.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SelectableText(
                                      'Studi: ${anime.studio}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ),
                                  SelectableText(
                                    'Producers: ${anime.producers}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                anime.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              anime.status,
                                              style: const TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                anime.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FavoriteButton(),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.share,
                                  color: Color(0xFFFCD7DF),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 25.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Synopsis',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SelectableText(
                anime.synopsis,
                textAlign: TextAlign.left,
                style: mobileContentStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Information',
                          textAlign: TextAlign.left,
                          style: mobileHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  SelectableText(
                    'Type: ${anime.type}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Episodes: ${anime.episodes.toString()} Episodes',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Premiered: ${anime.premiered}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Broadcast: ${anime.broadcast}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Licensors: ${anime.licensors}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Source: ${anime.source}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Demographic: ${anime.demographic}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Genres: ${anime.genres}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Duration: ${anime.duration}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Rating: ${anime.ageRating}',
                    style: mobileContentStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Recommendations',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 293,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animeList.length,
                itemBuilder: (BuildContext context, int i) {
                  if (anime.title != animeList[i].title) {
                    return SizedBox(
                      width: 185,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimeScreen(anime: animeList[i])));
                        },
                        child: ContentCard(
                          image: animeList[i].image,
                          title: animeList[i].title,
                          rating: animeList[i].rating,
                          tag: animeList[i].tag
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebsiteDetailAnimeScreen extends StatefulWidget {
  final Anime anime;

  WebsiteDetailAnimeScreen({required this.anime});

  @override
  State<WebsiteDetailAnimeScreen> createState() => _WebsiteDetailAnimeScreenState(anime: anime);
}

class _WebsiteDetailAnimeScreenState extends State<WebsiteDetailAnimeScreen> {
  final Anime anime;
  final _scrollController = ScrollController();

  _WebsiteDetailAnimeScreenState({required this.anime});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 20.0
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: anime.tag,
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage(anime.image),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    color: const Color(0xFFFCD7DF),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Image.asset(
                                    anime.image,
                                    height: 250,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      SelectableText(
                                        anime.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: SelectableText(
                                          'Studio: ${anime.studio}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0
                                          ),
                                        ),
                                      ),
                                      SelectableText(
                                        'Producers: ${anime.producers}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                anime.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                            Text(
                                              anime.status,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Text(
                                                anime.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FavoriteButton(),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.share,
                                    color: Color(0xFFFCD7DF),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Synopsis',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SelectableText(
                    anime.synopsis,
                    textAlign: TextAlign.left,
                    style: webContentStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Information',
                              textAlign: TextAlign.left,
                              style: webHeaderStyle,
                            ),
                          ],
                        ),
                      ),
                      SelectableText(
                        'Type: ${anime.type}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Episodes: ${anime.episodes.toString()} Episodes',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Premiered: ${anime.premiered}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Broadcast: ${anime.broadcast}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Licensors: ${anime.licensors}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Source: ${anime.source}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Demographic: ${anime.demographic}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Genres: ${anime.genres}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Duration: ${anime.duration}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Rating: ${anime.ageRating}',
                        style: webContentStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Recommendations',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 293,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.trackpad
                    }),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: animeList.length,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int i) {
                        if (anime.title != animeList[i].title) {
                          return SizedBox(
                            width: 185,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAnimeScreen(anime: animeList[i])));
                              },
                              child: ContentCard(
                                image: animeList[i].image,
                                title: animeList[i].title,
                                rating: animeList[i].rating,
                                tag: animeList[i].tag
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailLightNovelScreen extends StatelessWidget {
  final LightNovel lightNovel;

  DetailLightNovelScreen({required this.lightNovel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileDetailLightNovelScreen(lightNovel: lightNovel);
        } else {
          return WebsiteDetailLightNovelScreen(lightNovel: lightNovel);
        }
      },
    );
  }
}

class MobileDetailLightNovelScreen extends StatelessWidget {
  final LightNovel lightNovel;

  MobileDetailLightNovelScreen({required this.lightNovel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          offset: Offset(0.0, 0.2),
                          blurRadius: 20.0
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: lightNovel.tag,
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: AssetImage(lightNovel.image),
                        )
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: const Color(0xFFFCD7DF),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                lightNovel.image,
                                height: 150,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  SelectableText(
                                    lightNovel.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SelectableText(
                                      'Author: ${lightNovel.author}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0
                                      ),
                                    ),
                                  ),
                                  SelectableText(
                                    'Artist: ${lightNovel.artist}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                lightNovel.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              lightNovel.status,
                                              style: const TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 4.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                lightNovel.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FavoriteButton(),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.share,
                                  color: Color(0xFFFCD7DF),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 25.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Synopsis',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SelectableText(
                lightNovel.synopsis,
                textAlign: TextAlign.left,
                style: mobileContentStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Information',
                          textAlign: TextAlign.left,
                          style: mobileHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  SelectableText(
                    'Volume: ${lightNovel.volume.toString()} Volumes',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Chapter: ${lightNovel.chapter.toString()} Chapters',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Published: ${lightNovel.published}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Demographic: ${lightNovel.demographic}',
                    style: mobileContentStyle,
                  ),
                  SelectableText(
                    'Genres: ${lightNovel.genres}',
                    style: mobileContentStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Recommendations',
                    textAlign: TextAlign.left,
                    style: mobileHeaderStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 293,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lightNovelList.length,
                itemBuilder: (BuildContext context, int i) {
                  if (lightNovel.title != lightNovelList[i].title) {
                    return SizedBox(
                      width: 185,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLightNovelScreen(lightNovel: lightNovelList[i])));
                        },
                        child: ContentCard(
                          image: lightNovelList[i].image,
                          title: lightNovelList[i].title,
                          rating: lightNovelList[i].rating,
                          tag: lightNovelList[i].tag
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebsiteDetailLightNovelScreen extends StatefulWidget {
  final LightNovel lightNovel;

  WebsiteDetailLightNovelScreen({required this.lightNovel});

  @override
  State<WebsiteDetailLightNovelScreen> createState() => _WebsiteDetailLightNovelScreenState(lightNovel: lightNovel);
}

class _WebsiteDetailLightNovelScreenState extends State<WebsiteDetailLightNovelScreen> {
  final LightNovel lightNovel;
  final _scrollController = ScrollController();

  _WebsiteDetailLightNovelScreenState({required this.lightNovel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 20.0
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: lightNovel.tag,
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30.0)),
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage(lightNovel.image),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                      ),
                    ),
                    SafeArea(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CircleAvatar(
                                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    color: const Color(0xFFFCD7DF),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Image.asset(
                                    lightNovel.image,
                                    height: 250,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      SelectableText(
                                        lightNovel.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: SelectableText(
                                          'Author: ${lightNovel.author}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0
                                          ),
                                        ),
                                      ),
                                      SelectableText(
                                        'Artist: ${lightNovel.artist}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                lightNovel.status == 'Ongoing' ? Icons.access_time : Icons.check,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                            Text(
                                              lightNovel.status,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(right: 8.0),
                                              child: Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Text(
                                                lightNovel.rating.toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FavoriteButton(),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.share,
                                    color: Color(0xFFFCD7DF),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Synopsis',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SelectableText(
                    lightNovel.synopsis,
                    textAlign: TextAlign.left,
                    style: webContentStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Information',
                              textAlign: TextAlign.left,
                              style: webHeaderStyle,
                            ),
                          ],
                        ),
                      ),
                      SelectableText(
                        'Volume: ${lightNovel.volume.toString()} Volumes',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Chapter: ${lightNovel.chapter.toString()} Chapters',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Published: ${lightNovel.published}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Demographic: ${lightNovel.demographic}',
                        style: webContentStyle,
                      ),
                      SelectableText(
                        'Genres: ${lightNovel.genres}',
                        style: webContentStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Recommendations',
                        textAlign: TextAlign.left,
                        style: webHeaderStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 293,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.trackpad
                    }),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lightNovelList.length,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int i) {
                        if (lightNovel.title != lightNovelList[i].title) {
                          return SizedBox(
                            width: 185,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLightNovelScreen(lightNovel: lightNovelList[i])));
                              },
                              child: ContentCard(
                                image: lightNovelList[i].image,
                                title: lightNovelList[i].title,
                                rating: lightNovelList[i].rating,
                                tag: lightNovelList[i].tag
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}