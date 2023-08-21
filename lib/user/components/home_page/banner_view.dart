import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(index.isEven
                    ? '../assets/images/banner/banner1.jpg'
                    : '../assets/images/banner/banner1.jpg'),
              ),
            ),
          );
        },
        options: CarouselOptions(
            onPageChanged: (index, reason) {},
            height: 172,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            autoPlayCurve: Curves.easeInOutBack,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            initialPage: 2,
            pageSnapping: false,
            viewportFraction: .7,
            autoPlayInterval: Duration(seconds: 15)),
      ),
    );
  }
}
