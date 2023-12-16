import 'package:flutter/material.dart';
import 'package:hotel/services/hotel/hotel_service.dart';

import '../../style.dart';
import '../home/home.dart';

class EditDetail extends StatefulWidget {
  String? imageUrl;
  String? namaHotel;
  String? rate;
  String? lokasi;
  String? deskripsi;
  String? hotelId;
  String? lamaSewa;
  EditDetail(
      {this.imageUrl,
      this.namaHotel,
      this.rate,
      this.lokasi,
      this.deskripsi,
      this.hotelId,
      this.lamaSewa});

  @override
  State<EditDetail> createState() => _EditDetailState();
}

class _EditDetailState extends State<EditDetail> {
  TextEditingController _lamaSewaController = TextEditingController();

  Future<bool> postDataSewa(String lamaSewa, String hotelId) async {
    bool success =
        await HotelService().postData(lamaSewa, hotelId).then((success) {
      if (success == true) {
        return success;
      } else {
        throw Exception("gagal mengirim data");
      }
    });

    if (success) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.network(
                      fit: BoxFit.contain,
                      'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1081.jpg'),
                )),
            const SizedBox(
              width: 16,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat Datang!',
                    style: fontStyle5.copyWith(color: grey)),
                Text('Yazid Kurnia Ramadhan',
                    style: fontStyle6.copyWith(color: darkColor))
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Stack(children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              // color: Colors.red,
              child: Image.network(fit: BoxFit.cover, '${widget.imageUrl}'),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 100,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2 + 100,
                padding: EdgeInsets.fromLTRB(defaultMarginLayout.toDouble(), 32,
                    defaultMarginLayout.toDouble(), 32),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${widget.namaHotel}', style: fontStyle4),
                                Row(children: [
                                  Text('${widget.rate}'),
                                  Image.asset('assets/star.png', width: 24)
                                ]),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: fontStyle1.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 24,
                                  child: TextField(
                                    controller: _lamaSewaController,
                                    // keyboardType: ,
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '-',
                                        style: fontStyle1.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(widget.deskripsi!, style: fontStyle3),
                          ]),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextButton(
                              onPressed: () {
                                print(_lamaSewaController.text);
                                print(widget.hotelId!);
                                postDataSewa(_lamaSewaController.text,
                                        widget.hotelId!)
                                    .then((issuccess) {
                                  if (issuccess == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Berhasil mengirim data')));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Gagal mengirim data')));
                                  }
                                });
                              },
                              child: const Text('Pesan Kamar')))
                    ]),
              ),
            ])
          ]),
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
