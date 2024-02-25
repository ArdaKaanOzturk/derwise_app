import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _SearchCardsState();
}

class _SearchCardsState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.roboto(),
        ),
        backgroundColor: DerwiseTheme.backgroundApp,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CardGenre(),
              CardGenre(),
            ],
          ),
          Row(
            children: [
              CardGenre(),
              CardGenre(),
            ],
          ),
          Row(
            children: [
              CardGenre(),
              CardGenre(),
            ],
          ),
          Row(
            children: [
              CardGenre(),
              CardGenre(),
            ],
          ),
          Row(
            children: [
              CardGenre(),
              CardGenre(),
            ],
          ),
        ],
      ),
    );
  }
}

class CardGenre extends StatelessWidget {
  const CardGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 180,
        height: 100,
        color: DerwiseTheme.bottomBarSecondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Business",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Transform.rotate(
              angle: 0.0,
              child: Image.asset("assets/images/business.png",
                  width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
