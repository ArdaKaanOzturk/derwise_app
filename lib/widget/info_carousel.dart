//Custom Carousel Widget
import 'package:carousel_slider/carousel_slider.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class InfoCarousel extends StatefulWidget {
  final List<Widget> children;

  const InfoCarousel({super.key, required this.children});

  @override
  State<InfoCarousel> createState() => _InfoCarouselState();
}

class _InfoCarouselState extends State<InfoCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.children.map((child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DerwiseTheme.categoryBackground,
          ),
          padding: const EdgeInsets.all(16),
          child: child,
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1 / 5,
        enableInfiniteScroll: false,
        onPageChanged: (value, reason) {
          setState(() {});
        },
      ),
    );
  }
}
