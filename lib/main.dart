import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 // import 'package:flutter/src/foundation/key.dart';
// import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as Enc;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: api(),
    );
  }

}
String user ="";
final  plainText = "1234";
final key =Enc. Key.fromUtf8('0123456789abcdef');
final iv = Enc.IV.fromUtf8('0123456789abcdef');

final encoded =plainText;

final encrypted = Enc.Encrypted.fromBase64(encoded);
final encrypter = Enc.Encrypter(Enc.AES(key, mode: Enc.AESMode.ecb, padding: null));
final decrypted = encrypter.encrypt(encrypted, iv: iv);

Future<dynamic> createAlbum() async {

  final response = await http.post(
    Uri.parse('http://192.168.1.165/swagger/index.html'),

   headers: {
     "action":"dashboard/TestEncryption",

   },

  );

  if (response.statusCode == 200) {
    final plainText = response.body;
    final key =Enc. Key.fromUtf8('0123456789abcdef');
    final iv = Enc.IV.fromUtf8('0123456789abcdef');

    final encoded =plainText;

    final encrypted = Enc.Encrypted.fromBase64(encoded);
    final encrypter = Enc.Encrypter(Enc.AES(key, mode: Enc.AESMode.ecb, padding: null));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    // print(decrypted);




    return user=decrypted;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

decrypt(List user, String s) {
}
class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api> {
  @override
  void initState() {
    print(encrypted);
    createAlbum();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,

      child: Text(user),);
  }
}
