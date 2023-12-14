import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';

class AuthService {
  final String _baseUrl = 'https://6288b11c7af826e39e63fea5.mockapi.io/api';

  Future<List<UserModel>> loginProses(String email, String password) async {
    var response = await http
        .get(Uri.parse('$_baseUrl/users?email=$email&password=$password'));

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UserModel> userData = [];
      for (var i in data) {
        userData.add(UserModel.fromJson(i));
      }
      return userData;
    } else {
      print(response.body);
      throw Exception("Gagal Login");
    }
  }
}
