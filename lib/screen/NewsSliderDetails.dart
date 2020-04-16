import 'package:flutter/material.dart';
import 'package:ecommerce_v4/model/ProcheaPreyHttp.dart';
import 'package:flutter_html/flutter_html.dart';


class NewsSliderDetails extends StatefulWidget {

  final ProcheaPreyHttp value;

  NewsSliderDetails({Key key, this.value}) : super(key: key);

  @override
  _NewsSliderDetailsState createState() => _NewsSliderDetailsState();
}

class _NewsSliderDetailsState extends State<NewsSliderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('${widget.value.title.rendered}'),
      ),


      body: ListView(
        children: <Widget>[
          Container(
            child: new Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Image.network('${widget.value.fimg_url}'),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),

                  Padding(
                    child: Text(
                      '${widget.value.title.rendered}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),

                  Padding(
                    child: Html(data: '${widget.value.excerpt.rendered}'),
                    padding: EdgeInsets.all(20.0),
                  ),

                  Divider(thickness: 2,),

                  Padding(
                    child: Html(
                      data: '${widget.value.content.rendered}',
                    ),
                    padding: EdgeInsets.all(20.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
