import 'package:flutter/material.dart';
import 'package:hotel/pages/detail_hotel/detail_hotel.dart';
import 'package:hotel/pages/history_sewa/history_sewa.dart';
import 'package:hotel/services/hotel/hotel_service.dart';

import '../../models/hotel_model.dart';
import '../../style.dart';
import '../../widgets/header.dart';

class UiHome extends StatefulWidget {
  const UiHome({super.key});

  @override
  State<UiHome> createState() => _UiHomeState();
}

// Future<void> getAll

class _UiHomeState extends State<UiHome> {
  void initState() {
    super.initState();
    // _getData();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    // _getData();
  }

  List<HotelModel> dataHotel = [];

  // _getData() {
  //   var data = HotelService().getAllData().then((value) {
  //     print(value);
  //     if (value.isNotEmpty) {
  //       setState(() {
  //         dataHotel = value;
  //       });
  //       print(dataHotel);
  //     }
  //   });
  // }

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

    Widget cardHotelTile(String namaHotel, String alamat, String rate) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 95,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        // image: DecorationImage(
                        //     image: NetworkImage(
                        //         'https://media.istockphoto.com/id/1488153818/photo/kuala-lumpur-skyscraper-cityscape-sunset-golden-hour.webp?b=1&s=170667a&w=0&k=20&c=jOUgATRmdZSjQR8oy_hrqVu-F_ryBJWVmE_X8zvG0N0='))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                            fit: BoxFit.cover,
                            width: 95,
                            'https://media.istockphoto.com/id/1488153818/photo/kuala-lumpur-skyscraper-cityscape-sunset-golden-hour.webp?b=1&s=170667a&w=0&k=20&c=jOUgATRmdZSjQR8oy_hrqVu-F_ryBJWVmE_X8zvG0N0='),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$namaHotel', style: fontStyle4),
                        SizedBox(height: 12),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('$alamat'),
                              SizedBox(width: 3),
                              Image.asset('assets/loc.png', width: 24)
                            ])
                      ],
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('$rate', style: fontStyle3.copyWith(fontSize: 16)),
                      SizedBox(width: 3),
                      Image.asset('assets/star.png', width: 24, height: 24),
                      SizedBox(width: 12),
                    ]),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistorySewa()));
          },
          backgroundColor: secondaryColor,
          child: Image.asset('assets/his_book.png', width: 24, height: 24),
        ),
        body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMarginLayout.toDouble()),
          children: [
            const SizedBox(
              height: 12,
            ),
            Header(),
            const SizedBox(
              height: 18,
            ),
            Text(
              'All',
              style: fontStyle3.copyWith(
                  fontWeight: FontWeight.w500, color: darkColor),
            ),
            SizedBox(height: 20),
            Column(
              children: dataHotel.isNotEmpty
                  ? dataHotel.map((e) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailHotel(
                                          imageUrl: e.image,
                                          namaHotel: e.namaHotel,
                                          rate: e.rate.toString(),
                                          lokasi: e.alamat,
                                          deskripsi:
                                              'Lorem ipsum dolor sit amet consectetur. Faucibus ullamcorper nulla tristique at varius mauris. Mauris mauris diam eget eleifendnon gravida sagittis neque nunc. Elementum ut ut nibh non dim adipiscing. Eget lacus habitant cursus nulla morbi id ac.Lorem ipnulla tristique at varius mauris. Mauris mauris diam eget eleifend non gravida sagittis neque nunc. Elementum ut ut nibh non diam adipiscing. Eget lacus habitant cursus nulla morbi id ac.Lorem ipsum dolor sit amet consectetur. Faucibus ullamcorper nulla tristique at varius mauris. Mauris mauris diam eget eleifend',
                                          hotelId: e.id,
                                        )));
                          },
                          child:
                              cardHotelTile(e.namaHotel!, e.alamat!, e.rate!));
                    }).toList()
                  : [
                      Center(
                        child: Text('data kosong'),
                      )
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
