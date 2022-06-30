import 'package:flutter/material.dart';
import 'package:pocketotaku/models/manga_model.dart';

class AnimeLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.blue,
    );
  }
}

class MangaLibrary extends StatelessWidget {
  final int gridCount;
  final double _widthSize = 2.0;
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
              // TODO ON TAP
            },
            child: Card(
              color: Theme.of(context).accentColor,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              elevation: 3,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    manga.image,
                    fit: BoxFit.cover
                  ),
                  Container(
                    height: 200,
                    color: Colors.black26,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          manga.title,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LightNovelLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.green,
    );
  }
}






