import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_username/fetch_data.dart';
import 'package:flutter_username/insert_data.dart';
import 'package:flutter_username/signup.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getCurrentTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    return formattedTime;
  }

  String getCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMMM yyyy').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Application Development Engineering'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  getCurrentTime(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16),
                child: Text(
                  getCurrentDate(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.network(
              'https://rekreartive.com/wp-content/uploads/2018/10/Logo-Binus-University-Universitas-Bina-Nusantara-Original-PNG.png',
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Attending Name, NIM, and Major Bina Nusantara University',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InsertData()),
                );
              },
              child: const Text('Input Data'),
              color: Colors.blue,
              textColor: Colors.black,
              minWidth: 300,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FetchData()),
                );
              },
              child: const Text('History Data'),
              color: Colors.blue,
              textColor: Colors.black,
              minWidth: 300,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
