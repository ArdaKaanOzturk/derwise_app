import 'package:flutter/material.dart';

class toptutors extends StatelessWidget {
  const toptutors({super.key});

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
                toptutorsview(),
                SizedBox(
                  width: 12,
                ),
              ],
            );
          }),
    );
  }
}

class toptutorsview extends StatelessWidget {
  const toptutorsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 130,
          height: 130,
          image: AssetImage("assets/images/userImage7.jpeg"),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Erica Aldenberg",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Psychology ",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }
}
