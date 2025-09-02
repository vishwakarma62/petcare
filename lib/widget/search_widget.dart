import 'package:pet_care/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({super.key,required this.search});
  SearchModel search;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      color: AppColor.lightgray.withOpacity(0.5),
                      //spreadRadius: 5,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("${widget.search.IMG}",),
                    Text("${widget.search.name}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,letterSpacing: 0.5),)
                  ],
                ),
              );
  }
}