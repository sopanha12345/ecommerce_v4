
import 'package:ecommerce_v4/components/Horizontal_Catgories.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {

//  final Color backgroundColor;
//  final String headerTitle;
//
//  ListHeader(
//      this.backgroundColor,
//      this.headerTitle
//      );

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true, floating: false, delegate: Delegate(/*backgroundColor, headerTitle*/),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate{
//  final Color backgroundColor;
//  final String headerTitle;
//
//  Delegate(
//      this.backgroundColor,
//      this.headerTitle
//      );

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: HorizontalCategories()
    );
    //Container(
//      color: backgroundColor,
//      child: Center(
//        child: Text(
//          headerTitle,
//          style: TextStyle(color: Colors.white, fontSize: 36),
//        ),
//      ),
//    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 90;

  @override
  // TODO: implement minExtent
  double get minExtent => 90;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}