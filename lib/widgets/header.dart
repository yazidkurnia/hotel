import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../style.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
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
              Text('Selamat Datang!', style: fontStyle5.copyWith(color: grey)),
              Text('${box.read('username') ?? 'Derault'}',
                  style: fontStyle6.copyWith(color: darkColor))
            ],
          ),
        ],
      ),
    );
  }
}
