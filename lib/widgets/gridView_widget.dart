import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';

Widget WallpaperList({List<WallpaperModel>? wallpapers, context}) {
  return Container(
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpapers!.map((wallpapers) {
        return GridTile(
            child: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(wallpapers.profile_image!.medium, fit: BoxFit.cover,)),
        ));
      }).toList(),
    ),
  );
}
