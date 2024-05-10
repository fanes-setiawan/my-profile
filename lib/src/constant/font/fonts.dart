// ignore: file_names
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myprofile/src/constant/colors/myColors.dart';
import 'package:readmore/readmore.dart';

Widget tittletext(String title) {
  return Text(title,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Roboto',
          color: Colors.white.withOpacity(0.9),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25));
}

Widget titleBold({required String title, double? fontSize}) {
  return Text(title,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Roboto',
          fontSize: fontSize,
          color: MyColors().white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25));
}

Widget boldtext(String title) {
  return Text(title,
      style: TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.white.withOpacity(0.9),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25));
}

Widget settingText(String title) {
  return Text(title,
      style: const TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25));
}

Widget normaltext(String title) {
  return Text(title,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.black.withOpacity(0.9),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25));
}

Widget datetext(String title) {
  return Text(title,
      style: TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.white.withOpacity(0.9),
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.02));
}

Widget ratingtext(String title) {
  return Text(title,
      style: const TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.02));
}

Widget ultratittletext(String title) {
  return Text(title,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'open sans',
          color: Colors.white.withOpacity(0.9),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25));
}

Widget genrestext(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontFamily: 'open sans',
      decoration: TextDecoration.none,
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25,
    ),
  );
}

Widget readMore({required String title}) {
  return ReadMoreText(
    title,
    trimMode: TrimMode.Line,
    trimLines: 5,
    style: const TextStyle(
        fontFamily: 'open sans',
        decoration: TextDecoration.none,
        color: Colors.blueGrey,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.25),
    colorClickableText: Colors.grey,
    annotations: [
      Annotation(
        regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
        spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'open sans',
              decoration: TextDecoration.none,
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.25),
        ),
      ),
      Annotation(
        regExp: RegExp(r'<@(\d+)>'),
        spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
          text: title,
          style: TextStyle(
              fontFamily: 'open sans',
              decoration: TextDecoration.none,
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.25),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle tap, e.g., navigate to a user profile
            },
        ),
      ),
      // Additional annotations for URLs...
    ],
    moreStyle: const TextStyle(
        fontFamily: 'open sans',
        decoration: TextDecoration.none,
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.25),
  );
}

Widget readMoreChat(String title) {
  return ReadMoreText(
    title,
    trimMode: TrimMode.Line,
    trimLines: 4,
    style: TextStyle(
        fontFamily: 'open sans',
        decoration: TextDecoration.none,
        color: Colors.white.withOpacity(0.9),
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.25),
    colorClickableText: Colors.black,
    annotations: [
      Annotation(
        regExp: RegExp(r'#([a-zA-Z0-9_]+)'),
        spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'open sans',
              decoration: TextDecoration.none,
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.25),
        ),
      ),
      Annotation(
        regExp: RegExp(r'<@(\d+)>'),
        spanBuilder: ({required String text, TextStyle? textStyle}) => TextSpan(
          text: title,
          style: TextStyle(
              fontFamily: 'open sans',
              decoration: TextDecoration.none,
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.25),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle tap, e.g., navigate to a user profile
            },
        ),
      ),
      // Additional annotations for URLs...
    ],
    moreStyle: const TextStyle(
        fontFamily: 'open sans',
        decoration: TextDecoration.none,
        color: Colors.black,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.25),
  );
}

Widget showSnackBarText(String title) {
  return Text(title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.grey,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.25));
}

// ignore: non_constant_identifier_names
Widget Tabbartext(String title) {
  return Text(title,
      style: TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.white.withOpacity(1),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1));
}

Widget overviewtext(String title) {
  return Text(title,
      style: TextStyle(
          fontFamily: 'open sans',
          decoration: TextDecoration.none,
          color: Colors.white.withOpacity(0.9),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.25));
}
