import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: showUser()),
    );
  }
}

Widget showUser() {
  return FutureBuilder(
      future: getData(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // return Text(snapshot.data);
          List myData = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: myData.map((val) {
                    return ListTile(
                      title: Text("${val['first_name']} ${val['last_name']}"),
                      subtitle: Text(val['email']),
                      leading: CircleAvatar(child: Text(val['id'].toString())),
                      
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator.adaptive();
      }));
}

Future getData() async {
  var url = Uri.parse("https://reqres.in/api/users?page=2");
  final header = {HttpHeaders.contentTypeHeader: "application/json"};

  var response = await http.get(url, headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);

    print(res["page"]);
    return res["data"];
  }
  return null;
}
