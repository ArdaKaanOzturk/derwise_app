import 'package:flutter/material.dart';

class recommenCourses extends StatefulWidget {
  const recommenCourses({super.key});

  @override
  State<recommenCourses> createState() => _recommenCoursesState();
}

class _recommenCoursesState extends State<recommenCourses> {
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
                Recomcourse(),
                SizedBox(
                  width: 12,
                ),
              ],
            );
          }),
    );
  }
}

class Recomcourse extends StatelessWidget {
  const Recomcourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 130,
          height: 130,
          image: AssetImage("assets/images/software.png"),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Software",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Algorithms,Web Applications, ",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }
}
