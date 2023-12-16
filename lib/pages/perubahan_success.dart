import 'package:flutter/material.dart';

class PerubahanSuccessAlert extends StatelessWidget {
  const PerubahanSuccessAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        Text('Selamat Perubahan atau penambahan data berhasil'),
        SizedBox(
          height: 12,
        ),
        Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text('Kembali ke home')))
      ])),
    );
  }
}
