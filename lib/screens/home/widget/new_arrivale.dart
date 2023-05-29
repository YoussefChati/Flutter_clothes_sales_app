import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/clothes.dart';
import 'package:flutter_application_1/screens/home/widget/clothes_item.dart';

import 'categories_list.dart';


class NewArrival extends StatelessWidget {
  final clothesList = Clothes.generateClothes();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoriesList('New Arrival'),
          Container(
            height: 280,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ClothesItem(clothesList[index]),
                separatorBuilder: (_, index) => SizedBox(width: 10),
                itemCount: clothesList.length),
          )
        ],
      ),
    );
  }
}
