import 'package:flutter/material.dart';

import '../../style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Future<void> getAll

class _HomeState extends State<Home> {
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

    Widget cardHotelTile() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Text(
            'All',
            style: fontStyle3.copyWith(
                fontWeight: FontWeight.w500, color: darkColor),
          ),
          SizedBox(height: 20),
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
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/star.png', width: 24, height: 24),
                      Text('4.9', style: fontStyle3)
                    ]),
              ],
            ),
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: secondaryColor,
        ),
        body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMarginLayout.toDouble()),
          children: [
            const SizedBox(
              height: 12,
            ),
            header(),
            cardHotelTile()
          ],
        ),
      ),
    );
  }
}
