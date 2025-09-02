import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/selectspecialist.dart';

class ReviewsWidget extends StatefulWidget {
  ReviewsWidget({super.key, required this.reviews});
  SelectspecialistModel reviews;

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  bool isReadmore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset("${widget.reviews.IMG}"),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                      "${widget.reviews.name}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    RatingBar.builder(
                      itemSize: 15,
                      initialRating: widget.reviews.Reviews,
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
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 2),
              child: Text(
                "Thank you very much! Great clinic! The dog was limping, X-rayed, prescribed quality treatment. Dog of fights! Excellent specialists! more",
                maxLines: isReadmore ? 6 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                    color: AppColor.figmablacktext,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isReadmore = !isReadmore;
                  });
                },
                child: Text(
                  isReadmore ? "Read less" : "Read more",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "a verified review",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                      color: AppColor.figmablacktext),
                ),
                SizedBox(
                  width: 7,
                ),
                SvgPicture.asset("assets/images/success.svg"),
                Spacer(),
                Text("${widget.reviews.title}",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                        color: AppColor.lightgray)),
              ],
            ),
          ),
        
          
        ],
      ),
    );
  }
}
