import 'package:provider/provider.dart';
import '/Core/constants.dart';
import '/Models/AlbumModel.dart';
import '/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:rejolut_test_app/Providers/UserProvider.dart';

class FetchData {
  late UserModel user =
      UserModel(name: "404 Not found!", userId: "", username: "404 Not found!");
  late List<AlbumModel> albumList = [];
  Future<UserModel> fetchUser(int userId, context) async {
    var url = Uri.parse('$api' + "users/$userId");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      user = UserModel(
        name: jsonResponse["name"],
        userId: jsonResponse["id"].toString(),
        username: jsonResponse["username"],
      );
      Provider.of<UserProvider>(context, listen: false).setUser(user);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return user;
  }

  Future<List<AlbumModel>> fetchAlbumList(int userId) async {
    albumList = [];
    var url = Uri.parse('$api' + "albums?userId=$userId");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;

      jsonResponse.forEach((e) {
        albumList.add(
          AlbumModel(
            title: e["title"],
            id: e["id"].toString(),
          ),
        );
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return albumList;
  }
}
