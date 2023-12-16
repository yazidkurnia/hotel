import 'package:get_storage/get_storage.dart';

import '../../models/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelService {
  final String _baseUrl =
      'https://64c9113cb2980cec85c1dd1a.mockapi.io/hotel/api/hotels';
  GetStorage box = GetStorage();

  Future<List<HotelModel>> getAllData() async {
    var response = await http.get(Uri.parse('$_baseUrl'));

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<HotelModel> hotelData = [];
      for (var i in data) {
        hotelData.add(HotelModel.fromJson(i));
      }
      return hotelData;
    } else {
      print(response.body);
      throw Exception("Gagal mengambil data");
    }
  }

  Future<List<HotelModel>> getSingleData(String hotelId) async {
    var response = await http.get(Uri.parse('$_baseUrl?id=$hotelId'));

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<HotelModel> hotelData = [];
      for (var i in data) {
        hotelData.add(HotelModel.fromJson(i));
      }
      return hotelData;
    } else {
      print(response.body);
      throw Exception("Gagal mengambil data");
    }
  }

  Future<bool> postData(String? lamaSewa, String? hotelId) async {
    print(lamaSewa!);
    print(hotelId!);
    print(box.read('userid')!);
    var response =
        await http.post(Uri.parse('$_baseUrl/$hotelId/sewa_hotel/'), body: {
      'user_id': box.read('userid'),
      'hotelId': hotelId ?? '',
      'lama_sewa': lamaSewa ?? '',
    });

    print(response.body);
    if (response.statusCode == 201) {
      print(response.statusCode);
      return true;
    } else {
      print(response.body);
      print(response.statusCode);
      throw Exception(response.body);
    }

    // print(response.body);
    // throw Exception("Gagal mengirim data");
  }

  Future<bool> updateData(String hotelId, String namaHotel) async {
    var response = await http.put(
        Uri.parse(
          'https://64c9113cb2980cec85c1dd1a.mockapi.io/hotel/api/hotels/$hotelId',
        ),
        body: {'nama_hotel': namaHotel});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
