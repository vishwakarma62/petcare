

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class Rattingbar extends StatefulWidget {
  const Rattingbar({super.key});

  @override
  State<Rattingbar> createState() => _RattingbarState();
}

class _RattingbarState extends State<Rattingbar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  double changed=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          RatingBar(ignoreGestures: true,
            tapOnlyMode: true,
             itemSize: 40,
         initialRating: changed,
         direction: Axis.horizontal,
         allowHalfRating: true,
         itemCount: 5,
         ratingWidget: RatingWidget(
           full: Image.asset('assets/images/star.png'),
           half: Image.asset('assets/images/rating.png'),
           empty:Image.asset('assets/images/white-star.png'),
         ),
         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
         onRatingUpdate: (rating) {
           print(rating);
         },
      ),
      ElevatedButton(onPressed: (){
        setState(() {
          changed=1.5;
        });
      }, child: Text("change"))

     
        ],),
      ),
    );
  }
}