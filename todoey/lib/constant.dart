import 'package:flutter/material.dart';

const String kAppName = 'Todoey';
const int kGreyedBackGround = 0xFF757575;

const BoxDecoration kAddTaskScreenBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const UnderlineInputBorder kAddTaskUnderlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.lightBlueAccent,
    width: 4.0,
  ),
);

const TextStyle kAddTaskHeaderTextStyle = TextStyle(
  fontSize: 40.0,
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.w400,
);
