import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Offer extends StatelessWidget {
  const Offer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: CarouselSlider(
          items: [
            Image.network(
                'https://img.freepik.com/free-vector/special-offer-modern-sale-banner-template_1017-20667.jpg?w=2000'),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ-Zeztd6EvHyPey57uidGVgoncjPdvI3P4pgcSgF3pqFSCoY5bRwd1H97Olo8LTwGymk&usqp=CAU'),
            Image.network(
                'https://market.samadionline.ir/wp-content/uploads/2020/01/Freepik-Special-Offer-Lettering-On-Yellow-Origami-Ribbon.jpg'),
          ],
          options: CarouselOptions(
            height: 150,
            aspectRatio: 10 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}

