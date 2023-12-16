class SewaModel {
  String? userId;
  String? tanggal;
  String? lamaSewa;
  String? id;
  String? hotelId;

  SewaModel({this.userId, this.tanggal, this.lamaSewa, this.id, this.hotelId});

  SewaModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tanggal = json['tanggal'];
    lamaSewa = json['lama_sewa'];
    id = json['id'];
    hotelId = json['hotelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['tanggal'] = this.tanggal;
    data['lama_sewa'] = this.lamaSewa;
    data['id'] = this.id;
    data['hotelId'] = this.hotelId;
    return data;
  }
}
