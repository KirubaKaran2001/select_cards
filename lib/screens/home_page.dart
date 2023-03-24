// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:select_cards/screens/select_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool longPressFlag = false;
  List<int> indexList = [];

  @override
  Widget build(BuildContext context) {
    final result = indexList.fold<int>(
      0,
      (previousValue, indexList) {
        return (indexList == 0)
            ? previousValue + indexList.toInt()
            : previousValue + indexList.toInt();
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Cards ',
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              return SelectCard(
                index: index,
                longPressEnabled: longPressFlag,
                callback: () {
                  if (indexList.contains(index)) {
                    indexList.remove(index);
                  } else {
                    indexList.add(index);
                  }
                  longPress();
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (result < 1) ? '' : 'Result :${result.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void longPress() {
    setState(() {
      if (indexList.isEmpty) {
        longPressFlag = false;
      } else {
        longPressFlag = true;
      }
    });
  }
}
