import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/clothes.dart';
import 'package:flutter_application_1/screens/detail/detail_app_bar.dart';
import 'package:flutter_application_1/screens/detail/widget/add_cart.dart';
import 'package:flutter_application_1/screens/detail/widget/clothes_info.dart';
import 'package:flutter_application_1/screens/detail/widget/size_list.dart';
class Detailpage extends StatelessWidget {
  final Clothes clothes;
  Detailpage(this.clothes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DetailAppbar(clothes),Clothesinfo(clothes),
      SizeList(),
      AddCart(clothes)
    ],
  ),
),
    );
  }
}