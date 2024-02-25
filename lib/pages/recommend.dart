import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                RecomCard(),
                SizedBox(
                  width: 12,
                ),
              ],
            );
          }),
    );
  }
}

class RecomCard extends StatelessWidget {
  const RecomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 130,
          height: 130,
          image: AssetImage("assets/images/userImage1.jpeg"),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "John Peterson",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Software developer, Java",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }
}
