import 'package:flutter/material.dart';

import 'call.dart';
import 'community.dart';
import 'join.dart';

import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "dd",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now1 = DateTime.now();
  String localUserID = math.Random().nextInt(100000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // bottom: const TabBar(
            //   tabs: [
            //     Tab(icon: Icon(Icons.group)),
            //     Tab(icon: Icon(Icons.join_full)),
            //     Tab(icon: Icon(Icons.call)),
            //   ],
            // ),
            title: const Text('Cehpoint'),
          ),
          body: Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const join();
                    },
                  ),
                );
              },
              child: const Text("Proceed"),
            ),
          ),
          // body: TabBarView(
          //   children: [

          //     const join(),

          //   ],
          // ),
        ),
      ),
    );
  }
}
