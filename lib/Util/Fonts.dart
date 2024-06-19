import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';

String fontFamily = 'DMSans';

class Fonts {
  static double regularSmallpolice = 12;
  static double regularpolice = 14;
  static double regularMIdpolice = 20;
  static double boldSMallpolice = 20;
  static double boldpolice = 30;
  static double boldBigpolice = 40;

  //regularSmall
  static TextStyle regularPrimarySmall = TextStyle(
    color: couleur.primarycolors,
    fontSize: regularSmallpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularBlackSmall = TextStyle(
    color: couleur.Text,
    fontSize: regularSmallpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularSecondarySmall = TextStyle(
    color: couleur.Text,
    fontSize: regularSmallpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularHintSmall = TextStyle(
    color: couleur.HintText,
    fontSize: regularSmallpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularTertiarySmall = TextStyle(
    color: couleur.TertiaryColors,
    fontSize: regularSmallpolice,
    fontFamily: fontFamily,
  );
  //regular
  static TextStyle regularBlack = TextStyle(
    color: couleur.Text,
    fontSize: regularpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularPrimary = TextStyle(
      color: couleur.primarycolors,
      fontSize: regularpolice,
      fontFamily: fontFamily);
  static TextStyle regularSecondary = TextStyle(
      color: couleur.SecondaryColors,
      fontSize: regularpolice,
      fontFamily: fontFamily);
  static TextStyle regularHint = TextStyle(
      color: couleur.HintText, fontSize: regularpolice, fontFamily: fontFamily);
  //regularMid
  static TextStyle regularBlackMId = TextStyle(
    color: couleur.Text,
    fontSize: regularMIdpolice,
    fontFamily: fontFamily,
  );
  static TextStyle regularPrimaryMid = TextStyle(
      color: couleur.primarycolors,
      fontSize: regularMIdpolice,
      fontFamily: fontFamily);
  static TextStyle regularSecondaryMid = TextStyle(
      color: couleur.SecondaryColors,
      fontSize: regularMIdpolice,
      fontFamily: fontFamily);
  static TextStyle regularHintMid = TextStyle(
      color: couleur.HintText,
      fontSize: regularMIdpolice,
      fontFamily: fontFamily);
  //Boldmidsmall
  static TextStyle boldBlack = TextStyle(
      color: couleur.Text,
      fontSize: boldSMallpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldPrimary = TextStyle(
      color: couleur.primarycolors,
      fontSize: boldSMallpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldSecondary = TextStyle(
      color: couleur.SecondaryColors,
      fontSize: boldSMallpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldHint = TextStyle(
      color: couleur.HintText,
      fontSize: boldSMallpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldTertiary = TextStyle(
      color: couleur.TertiaryColors,
      fontSize: boldSMallpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  //Boldmid
  static TextStyle boldBlackMid = TextStyle(
      color: couleur.Text,
      fontSize: boldpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldPrimaryMid = TextStyle(
      color: couleur.primarycolors,
      fontSize: boldpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldSecondaryMid = TextStyle(
      color: couleur.SecondaryColors,
      fontSize: boldpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldHintMid = TextStyle(
      color: couleur.HintText,
      fontSize: boldpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldTertiaryMid = TextStyle(
      color: couleur.TertiaryColors,
      fontSize: boldpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  //Boldbig
  static TextStyle boldBlackBig = TextStyle(
      color: couleur.Text,
      fontSize: boldBigpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldPrimaryBig = TextStyle(
      color: couleur.primarycolors,
      fontSize: boldBigpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
  static TextStyle boldSecondaryBig = TextStyle(
      color: couleur.SecondaryColors,
      fontSize: boldBigpolice,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold);
}
