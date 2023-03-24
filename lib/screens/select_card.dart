// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SelectCard extends StatefulWidget {
  final int index;
  final bool longPressEnabled;
  final VoidCallback callback;

  const SelectCard(
      {Key? key,
      required this.index,
      required this.longPressEnabled,
      required this.callback})
      : super(key: key);

  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        setState(() {
          selected = !selected;
        });
        widget.callback();
      },
      onTap: () {
        if (widget.longPressEnabled) {
          setState(() {
            selected = !selected;
          });
          widget.callback();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: selected
            ? BoxDecoration(
                color: Colors.black38,
                border: Border.all(
                  color: Colors.black,
                ),
              )
            : const BoxDecoration(),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Title ${widget.index}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
