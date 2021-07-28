import 'package:rejolut_test_app/Core/constants.dart';
import 'package:rejolut_test_app/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FetchUser {
  late UserModel user;
  Future<UserModel> fetchUser(int userId) async {
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
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return user;
  }
}
