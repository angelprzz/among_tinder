import 'package:flutter/material.dart';

class SwipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: null,
            child: Text('Dislike'),
          ),
          ElevatedButton(onPressed: null, child: Text('Like'),)
        ],
      ),
    );
  }
}