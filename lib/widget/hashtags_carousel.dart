//Custom Carousel Widget
import 'package:carousel_slider/carousel_slider.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class HashtagsCarousel extends StatefulWidget {
  final List<Widget> children;

  const HashtagsCarousel({super.key, required this.children});

  @override
  State<HashtagsCarousel> createState() => _HashtagsCarouselState();
}

class _HashtagsCarouselState extends State<HashtagsCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.children.map((child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:DerwiseTheme.categoryBackground,
          ),
          padding: const EdgeInsets.all(16),
          child: child,
        );
      }).toList(),
      options: CarouselOptions(
        height: 52,
        viewportFraction: 1 / 5,
        enableInfiniteScroll: false,
        onPageChanged: (value, reason) {
          setState(() {});
        },
      ),
    );
  }
}
