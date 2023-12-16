class HotelModel {
  String? createdAt;
  String? namaHotel;
  String? rate;
  String? alamat;
  String? image;
  String? biayaSewa;
  String? id;

  HotelModel(
      {this.createdAt,
      this.namaHotel,
      this.rate,
      this.alamat,
      this.image,
      this.biayaSewa,
      this.id});

  HotelModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    namaHotel = json['nama_hotel'];
    rate = json['rate'];
    alamat = json['alamat'];
    image = json['image'];
    biayaSewa = json['biaya_sewa'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['nama_hotel'] = this.namaHotel;
    data['rate'] = this.rate;
    data['alamat'] = this.alamat;
    data['image'] = this.image;
    data['biaya_sewa'] = this.biayaSewa;
    data['id'] = this.id;
    return data;
  }
}
