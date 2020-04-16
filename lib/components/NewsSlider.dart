import 'package:ecommerce_v4/screen/NewsSliderDetails.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_v4/model/ProcheaPreyHttp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';




class NewsSlider extends StatefulWidget {

final List<ProcheaPreyHttp> list;
NewsSlider({this.list});

@override
_NewsSliderState createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {

  int _current = 0;

  int index = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
              height: 180,
              initialPage: 0,
              onPageChanged: (index){
                setState(() {
                  _current = index;
                });
              },
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayInterval: Duration(seconds: 7),
              reverse: false,
              items: widget.list.map((imageUrl){
                return Builder(
                  builder: (BuildContext context){
                    return InkWell(
                      onTap: (){
                        var route = new MaterialPageRoute(builder: (BuildContext context) =>
                        new NewsSliderDetails(value: widget.list[_current],));
                        Navigator.of(context).push(route);
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            child: Image.network(imageUrl.fimg_url),
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                          ),
                          Container(
                            height: 100.0,
//                          width: MediaQuery.of(context).size.width,

                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                            ),
                            child: Html(data: imageUrl.title.rendered, customTextStyle: (node, TextStyle baseStyle){
                              return baseStyle.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white));
                            },),
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList()
          ),
        ],
      ),
    );
  }
}
