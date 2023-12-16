import 'package:flutter/material.dart';
import 'package:hotel/models/hotel_model.dart';
import 'package:hotel/pages/detail_hotel/edit_detail.dart';
import 'package:hotel/services/hotel/hotel_service.dart';
import 'package:hotel/services/sewa/sewa_service.dart';
import 'package:hotel/style.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/sewa_model.dart';
import '../../widgets/header.dart';
import '../home/home.dart';

class HistorySewa extends StatefulWidget {
  const HistorySewa({super.key});

  @override
  State<HistorySewa> createState() => _HistorySewaState();
}

class _HistorySewaState extends State<HistorySewa> {
  List<SewaModel> dataSewa = [];
  TextEditingController _hotelNameController = TextEditingController();
  void initState() {
    super.initState();
    getInitSewa();
  }

  getInitSewa() {
    var data = SewaService().getDataSewa().then((value) {
      print(value);

      if (value.isNotEmpty) {
        setState(() {
          dataSewa = value;
        });
      }
    });
    print('total data sewa: $dataSewa');
  }

  _updateData(String hotelId, String namaHotel) {
    HotelService().updateData(hotelId, namaHotel);
  }

  deleteDataSewa(String hotelId, String sewaId) async {
    bool success = await SewaService().deleteSewa(hotelId, sewaId);
    print(success);
    if (success == true) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Berhasil menghapus data')));

      setState(() {
        getInitSewa();
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Gagal menghapus data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header1() {
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
        backgroundColor: const Color(0xfff8f8f8),
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: defaultMarginLayout.toDouble()),
            children: [
              const SizedBox(
                height: 12,
              ),
              Header(),
              const SizedBox(
                height: 12,
              ),
              const Text('History Book'),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: dataSewa.isNotEmpty
                    ? dataSewa.map((e) {
                        return Container(
                          // color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${e.tanggal}'),
                                        Text('${e.lamaSewa}'),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextButton(
                                                onPressed: () {
                                                  var data = HotelService()
                                                      .getSingleData(e.hotelId!)
                                                      .then((value) {
                                                    if (value.isNotEmpty) {
                                                      print(value[0].namaHotel);
                                                      setState(() {
                                                        _hotelNameController
                                                                .text =
                                                            value[0].namaHotel!;
                                                      });
                                                      Alert(
                                                        context: context,
                                                        // type: AlertType.warning,
                                                        title:
                                                            "Ubah nama hotel",
                                                        content: Center(
                                                          child: TextField(
                                                            controller:
                                                                _hotelNameController,
                                                          ),
                                                        ),
                                                        desc:
                                                            "Merubah nama hotel",
                                                        buttons: [
                                                          DialogButton(
                                                            child: Text(
                                                              "Update data",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18),
                                                            ),
                                                            // con
                                                            onPressed: () {
                                                              print(e.hotelId);

                                                              // print(e.hotelName!);
                                                              HotelService()
                                                                  .updateData(
                                                                      e
                                                                          .hotelId!,
                                                                      _hotelNameController
                                                                          .text)
                                                                  .then(
                                                                      (isSuccess) {
                                                                if (isSuccess ==
                                                                    true) {
                                                                  print(
                                                                      isSuccess);
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              Home()));
                                                                } else {
                                                                  print(
                                                                      isSuccess);
                                                                }
                                                              });
                                                            },
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    179,
                                                                    134,
                                                                    1.0),
                                                          ),
                                                        ],
                                                      ).show();
                                                    }
                                                  });
                                                },
                                                child: Text('Edit',
                                                    style: fontStyle2.copyWith(
                                                      color: darkColor,
                                                    )))),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: TextButton(
                                                onPressed: () {
                                                  deleteDataSewa(
                                                      e.hotelId!, e.id!);
                                                  setState(() {});
                                                },
                                                child: Text('Delete',
                                                    style: fontStyle2.copyWith(
                                                        color: Colors.white)))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                        );
                      }).toList()
                    : [
                        const Center(
                          child: Text('data kosong'),
                        )
                      ],
              )
            ]),
      ),
    );
  }
}
