import 'dart:convert';
import 'dart:io';

import 'package:ch07/first_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final user = TextEditingController();
  final pass1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Textlogo(),
              SizedBox(
                height: 50,
              ),
              inpunUser(),
              inpunPass1(),
              inpunPass2(),
              Submit(),
              SizedBox(
                height: 20,
              ),
              Backsign()
            ],
          ),
        ),
      ),
    );
  }

  Widget inpunUser() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
        child: TextFormField(
          controller: user,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            fillColor: Colors.white10.withOpacity(0.7),
            filled: true,
            hintText: 'username',
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.blueGrey,
              size: 35,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget inpunPass1() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
        child: TextFormField(
          controller: pass1,
          textAlign: TextAlign.center,
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white10.withOpacity(0.7),
            filled: true,
            hintText: 'password',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.blueGrey,
              size: 35,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget inpunPass2() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
        child: TextFormField(
          controller: pass1,
          textAlign: TextAlign.center,
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white10.withOpacity(0.7),
            filled: true,
            hintText: 'password',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.blueGrey,
              size: 35,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget Submit() {
    return SizedBox(
      width: 320,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          var url = Uri.parse("https://reqres.in/api/register");
          final header = {HttpHeaders.contentTypeHeader: "application/json"};
          // final header = {HttpHeaders.contentTypeHeader: "application/x-www-from-urlencoded"};
          final req = {};
          req["user"] = user.text;
          req["password"] = pass1.text;
          req["password"] = pass1.text;
           

          final myJSON = jsonEncode(req);

          var response = await http.post(url, headers: header, body: myJSON);
          print(response.statusCode);
          if (response.statusCode == 200) {
            final res = jsonDecode(response.body);

            print(res["token"]);
          }
        },
        child: const Text(
          'ลงทะเบียน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.orangeAccent,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.pink[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  Widget Backsign() {
    return SizedBox(
      width: 320,
      height: 50,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstPage()));
        },
        child: const Text(
          'กลับหน้าล็อกอิน',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.orangeAccent,
          ),
        ),
      ),
    );
  }

  Widget Textlogo() {
    return Text('ลงทะเบียน');
  }
}
