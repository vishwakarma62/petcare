import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';

class MyPet extends StatefulWidget {
  const MyPet({super.key});

  @override
  State<MyPet> createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 49, right: 14),
              child: Row(
                children: [
                  InkWell(highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                    onTap: () {
                    Navigator.pop(context);
                  },
                    child: Container(
                        width: 32,
                        height: 32,
                        child: SvgPicture.asset(
                          "assets/images/arrow left.svg",
                          fit: BoxFit.cover,
                          color: AppColor.figmavoilet,
                        )),
                  ),
                  Spacer(),
                  Text(
                    "My pets",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.39,
                        fontStyle: FontStyle.normal),
                  ),
                  Spacer(),
                  Container(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      "assets/images/plus add.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 279,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      color: AppColor.lightgray,
                    ),
                    BoxShadow(
                      offset: Offset(8, 0),
                      blurRadius: 12,
                      color: AppColor.lightgray,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:24.0,top: 24,right: 24),
                      child: Row(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/edit icon.svg"),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.19,
                                    color: AppColor.figmavoilet,
                                    fontStyle: FontStyle.normal),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                              CircleAvatar(
                                radius: 56,
                                backgroundImage: AssetImage("assets/images/Ellipse.png"),
                              ),
                              SizedBox(height: 24,),
                              Text("Troy",style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.49,
                                    color: AppColor.figmablacktext,
                                    fontStyle: FontStyle.normal)),
                                    Text("Toy terrier",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.19,
                                    color: AppColor.lightgray,
                                    fontStyle: FontStyle.normal)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColor.lightgray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 13.0,bottom: 13),
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset("assets/images/plus add.svg",fit: BoxFit.cover,)),
                      Text("Add another pet",style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.19,
                                          color: AppColor.figmavoilet,
                                          fontStyle: FontStyle.normal)),
                                          Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
