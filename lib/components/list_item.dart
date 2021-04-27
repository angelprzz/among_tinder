import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({
    @required this.title,
    @required this.imageRoute,
    this.contentPadding = 5.0,
    this.borderRadius = 100.0,
  });

  final String title;
  final String imageRoute;
  final double contentPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(contentPadding),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.asset(
            imageRoute,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title),
      ),
    );
  }
}