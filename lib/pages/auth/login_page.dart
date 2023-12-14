import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel/pages/home/home.dart';
import 'package:hotel/services/auth/auth_service.dart';
import 'package:hotel/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<bool> login(String email, String password) async {
    try {
      var data = await AuthService().loginProses(email, password);
      if (data.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Maaf akun tidak ditemukan')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text('Berhasil Login')));
        Future.delayed(Duration(milliseconds: 3000), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => Home())));
        });
      }
      return true;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget inputUsername() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: fontStyle5,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              fillColor: grey,
              prefixIcon: const Icon(Icons.verified_user),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: grey, width: 5.0),
              ),
              hintText: 'Username',
            ),
          )
        ],
      );
    }

    Widget inputPassword() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: fontStyle5,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: grey,
              prefixIcon: const Icon(Icons.password),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: grey, width: 5.0),
              ),
              // hintText: '......',
            ),
          )
        ],
      );
    }

    Widget buttonSignIn() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(12)),
        child: TextButton(
          child: Text(
            'Sign In',
            style: fontStyle5.copyWith(color: light),
          ),
          onPressed: () {
            login(_emailController.text, _passwordController.text);
            print('print');
          },
        ),
      );
    }

    Widget cardForm() {
      return Container(
        width: double.infinity,
// height: 932,
        decoration: const BoxDecoration(color: Color(0x28D9D9D9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3 - 100,
            ),
            Text('Sign In',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 32)),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 48,
              // height: 265,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  inputUsername(),
                  const SizedBox(
                    height: 12,
                  ),
                  inputPassword(),
                  const SizedBox(
                    height: 12,
                  ),
                  buttonSignIn()
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/login_bg.png',
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height,
                  )),
              cardForm(),
            ],
          )
        ],
      ),
    );
  }
}
