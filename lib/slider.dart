import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;

  final List<String> imgList = [
    'assets/ad.png',
    'assets/ad.png',
    'assets/ad.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((url) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            aspectRatio: 3.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 0.8,height: 0.8,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(255, 255, 255, 0.9)
                    : Color.fromRGBO(255, 255, 255, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}