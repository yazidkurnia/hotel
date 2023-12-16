import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../models/sewa_model.dart';
import 'dart:convert';

class SewaService {
  final String _baseUrl = 'https://64c9113cb2980cec85c1dd1a.mockapi.io';
  GetStorage box = GetStorage();

  Future<List<SewaModel>> getDataSewa() async {
    var response = await http.get(Uri.parse(
        '$_baseUrl/hotel/api/hotels/1/sewa_hotel/?user_id=${box.read('userid')}'));

    print('service result: ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      List data = jsonDecode(response.body);
      List<SewaModel> dataSewa = [];
      for (var element in data) {
        dataSewa.add(SewaModel.fromJson(element));
      }
      return dataSewa;
    } else {
      throw Exception("gagal mengambil data");
    }
  }

  Future<bool> deleteSewa(String hotelId, String sewaHotel) async {
    var response = await http.delete(
        Uri.parse('$_baseUrl/hotel/api/hotels/$hotelId/sewa_hotel/$sewaHotel'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
