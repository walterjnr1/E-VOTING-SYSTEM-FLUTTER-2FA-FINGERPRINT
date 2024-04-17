import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

Widget CarouselSliderSection = CarouselSlider(
  items: [
    //1th Image of Slider
    Container(
      width: 950,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/carousel/1.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),

    //2th Image of Slider
    Container(
      width: 950,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/carousel/2.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    //3th Image of Slider
    Container(
      width: 950,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/carousel/3.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    //4th Image of Slider
    Container(
      width: 950,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: AssetImage('assets/carousel/4.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
  ],

  //Slider Container properties
  options: CarouselOptions(
    height: 130.0,
    enlargeCenterPage: true,
    autoPlay: true,
    aspectRatio: 16 / 9,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    viewportFraction: 0.9,
  ),
);

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
