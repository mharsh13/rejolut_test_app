import '/Core/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '/Models/PhotoModel.dart';

class FetchData {
  List<PhotoModel> photosList = [];
  Future<List<PhotoModel>> fetchPhotos(int albumId) async {
    photosList = [];
    var url = Uri.parse('$api' + "photos?albumId=$albumId");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;
      jsonResponse.forEach((e) {
        photosList.add(
          PhotoModel(
            thumbnail: e["thumbnailUrl"],
            title: e["title"],
            id: e["id"].toString(),
            url: e["url"],
          ),
        );
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return photosList;
  }
}
