import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/selectspecialist.dart';

class NearbyVetwidget extends StatefulWidget {
  NearbyVetwidget({super.key, required this.nearbyvet});
  SelectspecialistModel nearbyvet;

  @override
  State<NearbyVetwidget> createState() => _NearbyVetwidgetState();
}

class _NearbyVetwidgetState extends State<NearbyVetwidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    child: SvgPicture.asset("${widget.nearbyvet.IMG}",fit: BoxFit.cover,)),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "${widget.nearbyvet.name}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.36),
                      ),
                      Text(
                        "${widget.nearbyvet.title}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: widget.nearbyvet.Reviews,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Text("23 Reviews",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.4)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text("${widget.nearbyvet.years}",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4)),
                  Spacer(),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.lightgray,
                    ),
                    child: SvgPicture.asset("assets/images/map pin.svg"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("${widget.nearbyvet.location}",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4)),
                  SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset("assets/images/wallet.svg"),
                  SizedBox(
                    width: 8,
                  ),
                  Text("${widget.nearbyvet.amount}",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4)),
                  SizedBox(
                    width: 12,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    
  }
}
