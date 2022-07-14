import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          _favorite = !_favorite;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(255, 255, 255, 0.2),
        ),
        child: Center(
          child: Icon(
            _favorite ? Icons.favorite : Icons.favorite_border,
            color: _favorite ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
            size: screenWidth <= 600 ? 24.0 : 30.0,
          ),
        ),
      ),
    );
  }
}
