import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)
            // TODO: Add TextField widgets (101)

            // [Name]
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            // [ Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true, //bg card mengenai area ketuk
                labelText: 'Password',
              ),
              obscureText: true, // agar text passwort berbentuk butir
            ),

            // TODO: Add button bar (101)
            OverflowBar(
              //untuk tata letak horizontal
              alignment: MainAxisAlignment.end,
              //TODO: add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                //TODO: add buttons(101)
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    //TODO: clear the text fields(101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                //TODO: add an elevation to NEXT(103)
                //TODO: add a beveled rectangular border to CANCEL (103)
                ElevatedButton(
                    child: const Text('NEXT'),
                    onPressed: () {
                      // on pressed kosong agar tombol tidak di nonaktifkan
                      // TODO: Show the next page (101)
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
