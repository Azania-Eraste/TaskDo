import 'package:azaproject/Util/Colors.dart';
import 'package:azaproject/Util/Fonts.dart';
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
  MyColors couleur = MyColors();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 7, bottom: 7),
        decoration: BoxDecoration(
            color: couleur.TertiaryColors,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: couleur.SecondaryColors)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  sous_titre,
                  style: Fonts.regularSecondary,
                )
              ],
            ),
            Row(
              children: [
                Text(Titre, style: Fonts.boldSecondaryMid),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Fonts.regularSecondary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(lieux, style: Fonts.regularSecondary),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
