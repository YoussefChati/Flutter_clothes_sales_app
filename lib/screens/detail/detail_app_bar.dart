//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/clothes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/screens/detail/widget/color_picker.dart';

class DetailAppbar extends StatefulWidget {
  final Clothes clothes;
  DetailAppbar(this.clothes);

  @override
  State<DetailAppbar> createState() => _DetailAppbarState();
}

class _DetailAppbarState extends State<DetailAppbar> {
  final List<Color> colors = [
    Color(0xFFE6CFC6),
    Color(0xFFEEDFB5),
    Color(0xFFCAE2C5),
    Color(0xFFBAE6EE),
  ];
  final CarouselController _controller = CarouselController();
  int _currentpage = 0;
  int _currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentpage = index;
                  });
                }),
            items: widget.clothes.detailUrl
                .map((e) => Builder(
                      builder: (context) => Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(e), fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ))
                .toList(),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: Row(
            children: widget.clothes.detailUrl
                .asMap()
                .entries
                .map((entry) => GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withOpacity(
                                _currentpage == entry.key ? 0.9 : 0.4)),
                      ),
                    ))
                .toList(),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 175,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)),
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentColor = index;
                        });
                      },
                      child: ColorPicker(_currentColor == index, colors[index]),
                    ),
                separatorBuilder: (_, index) => SizedBox(height: 3),
                itemCount: colors.length),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
