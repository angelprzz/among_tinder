import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({
    @required this.title,
    @required this.imageRoute,
  });

  final String title;
  final String imageRoute;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
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