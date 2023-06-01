import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/home/widget/best_sale.dart';
import 'package:flutter_application_1/screens/home/widget/custom_app_bar.dart';
import 'package:flutter_application_1/screens/home/widget/new_arrivale.dart';
import 'package:flutter_application_1/screens/home/widget/search_input.dart';

//import 'dart:html';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final bottomlist = ['home', 'menu', 'heart', 'user'];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SearchInput(),
            NewArrival(),
            BestSell(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: bottomlist
            .map((e) => BottomNavigationBarItem(
                  label: e,
                  icon: Image.asset('assets/icons/$e.png', width: 25),
                ))
            .toList(),
      ),
    );
  }
}
