import 'package:apiuse/models/api_model.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  int index;
  Welcome item;
  ImageScreen(this.index, this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.id.toString()),
            Text(item.albumId.toString()),
            Text(item.title!),
            Text(item.url!),
          ],
        ),
      ),
    );
  }
}
