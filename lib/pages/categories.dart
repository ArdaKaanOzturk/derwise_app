import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
