import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendedor/UI/Pages/seller_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userText = TextEditingController();
  TextEditingController passText = TextEditingController();

  late bool _obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: loginBody(),
    );
  }

  AppBar myAppbar() => AppBar(
        title: const Text(
          'Entrar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      );

  loginBody() {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ListView(
        children: [
          const SizedBox(height: 150),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            child: TextFormField(
              controller: userText,
              decoration: InputDecoration(
                labelText: 'usuario',
                floatingLabelStyle:
                    MaterialStateTextStyle.resolveWith((states) {
                  return const TextStyle(color: Colors.black);
                }),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            child: TextFormField(
              controller: userText,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  labelText: 'clave',
                  floatingLabelStyle:
                      MaterialStateTextStyle.resolveWith((states) {
                    return const TextStyle(color: Colors.black);
                  }),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  suffixIcon: CupertinoButton(
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      })),
            ),
          ),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const SellerPage()),
                          (route) => false);
                },
                child: const Text('Entrar', style: TextStyle(color: Colors.black),),
              ))
        ],
      ),
    );
  }
}
