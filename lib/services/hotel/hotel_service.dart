import '../../models/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelService {
  final String _baseUrl =
      'https://64c9113cb2980cec85c1dd1a.mockapi.io/hotel/api/hotels';

  Future<List<HotelModel>> getAllData() async {
    var response = await http.get(Uri.parse('$_baseUrl'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<HotelModel> hotelData = [];
      for (var i in data) {
        hotelData.add(HotelModel.fromJson(i));
      }
      return hotelData;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
