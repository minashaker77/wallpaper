import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widgets/gridView_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class SearchScreen extends StatefulWidget {
   SearchScreen({this.searchquery});
  String? searchquery;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<WallpaperModel> wallpapers = [];
  String apiKey = '563492ad6f91700001000001938a82b29b074a5abe1400ee6929e776';

  getSearchWallpaper(String query) async {
    var url =
        "https://api.pexels.com/v1/search?query=$query&per_page=1";
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": apiKey,
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData[""].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSearchWallpaper(widget.searchquery!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wallpaper'),
            Text(
              'Flutter',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              WallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
