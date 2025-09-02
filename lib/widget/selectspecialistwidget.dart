import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/selectspecialist.dart';

class Selectspecialistwidget extends StatelessWidget {
  Selectspecialistwidget({super.key, required this.specialist});
  SelectspecialistModel specialist;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 9),
                child: Image.asset(
                  "${specialist.IMG}",
                  width: 72,
                  height: 72,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("${specialist.name}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.39,
                              color: AppColor.figmablacktext)),
                    ),
                    Container(
                      child: Text("${specialist.title}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: AppColor.figmablacktext)),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 15,
                          initialRating: specialist.Reviews,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("125 Reviews",
                            style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: AppColor.ratting,
                                letterSpacing: 0.9)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0, left: 16, right: 16),
            child: Row(
              children: [
                Text("${specialist.years}",
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: AppColor.ratting,
                        letterSpacing: 0.9)),
                Text("Years of experience",
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: AppColor.ratting,
                        letterSpacing: 0.9)),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    backgroundColor: AppColor.lightgray,
                    radius: 8,
                    child: SvgPicture.asset("assets/images/map pin.svg")),
                SizedBox(
                  width: 8,
                ),
                Text("${specialist.location}",
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: AppColor.figmablacktext,
                        letterSpacing: 0.9)),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    backgroundColor: AppColor.lightgray,
                    radius: 8,
                    child: SvgPicture.asset("assets/images/wallet.svg")),
                SizedBox(
                  width: 8,
                ),
                Text("${specialist.amount}",
                    style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: AppColor.figmablacktext,
                        letterSpacing: 0.9)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
