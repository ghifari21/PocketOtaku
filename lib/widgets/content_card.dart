import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String image;
  final String title;
  final String tag;
  final double rating;

  ContentCard({required this.image, required this.title, required this.rating, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Card(
        color: Theme.of(context).accentColor,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        child: Stack(
          children: <Widget>[
            Image.asset(
                image,
                fit: BoxFit.cover
            ),
            Container(
              height: 1000,
              color: Colors.black26,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        rating.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16.0,
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
  }
}
