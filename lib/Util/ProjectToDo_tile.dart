import 'package:azaproject/Util/Colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProjectTile extends StatelessWidget {
  final String Titre;
  final String date;
  final String sous_titre;
  final String lieux;

  ProjectTile({
    super.key,
    required this.Titre,
    required this.date,
    required this.sous_titre,
    required this.lieux,
  });
  MyColors couleur = new MyColors();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 24, bottom: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(sous_titre)],
            ),
            Row(
              children: [
                Text(
                  Titre,
                  style: TextStyle(
                      color: couleur.SecondaryColors,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(color: couleur.SecondaryColors),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    lieux,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: couleur.SecondaryColors),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: couleur.TertiaryColors,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: couleur.SecondaryColors)),
      ),
    );
  }
}
