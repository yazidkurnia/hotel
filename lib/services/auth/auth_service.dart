import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final String _baseUrl = 'https://6288b11c7af826e39e63fea5.mockapi.io/api';
  GetStorage box = GetStorage();

  Future<List<UserModel>> loginProses(String email, String password) async {
    GetStorage box = GetStorage();
    var response = await http
        .get(Uri.parse('$_baseUrl/users?email=$email&password=$password'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UserModel> userData = [];
      for (var i in data) {
        box.write('username', i['name']);
        box.write('userid', i['id']);
        print(box.read('username'));
        print(box.read('userid'));
        userData.add(UserModel.fromJson(i));
      }
      return userData;
    } else {
      print(response.body);
      throw Exception("Gagal Login");
    }
  }
}
