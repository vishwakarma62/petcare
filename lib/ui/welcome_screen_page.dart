import 'package:pet_care/intl/appcolor.dart';
import 'package:pet_care/ui/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool stepone = true;
  bool steptwo = false;
  bool stepthree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          if (stepone == true)
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                      ),
                      Spacer(),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.figmasignuptext,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.13,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 375.7,
                        child: SvgPicture.asset(
                          "assets/images/illustration.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 390.7, left: 150, right: 150.7),
                        child: Row(
                          children: [
                            Spacer(),
                            if (stepone == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepone == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (steptwo == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (steptwo == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (stepthree == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepthree == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 56.3),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Pet Care",
                        style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.48),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            "All types of services for your pet in one",
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.figmalightblack),
                          ),
                          Text("place, instantly searchable.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.figmalightblack)),
                          SizedBox(
                            height: 48,
                          ),
                          SizedBox(
                            width: 260,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  stepone = false;
                                  steptwo = true;
                                  stepthree = false;
                                });
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.figmabutton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          if (steptwo == true)
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, right: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            setState(() {
                              stepone = true;
                              steptwo = false;
                              stepthree = false;
                            });
                          },
                          child: Container(
                              width: 34,
                              height: 34,
                              child: SvgPicture.asset(
                                "assets/images/arrow left.svg",
                                fit: BoxFit.cover,
                                color: AppColor.figmavoilet,
                              )),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.figmasignuptext,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.13,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 375.7,
                        child: SvgPicture.asset(
                          "assets/images/illustration (1).svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 390.7, left: 150, right: 150.7),
                        child: Row(
                          children: [
                            Spacer(),
                            if (stepone == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepone == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (steptwo == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (steptwo == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (stepthree == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepthree == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 56.3),
                  child: Column(
                    children: [
                      Text(
                        "Proven experts",
                        style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.48),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            "We interview every specialist before",
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.figmalightblack),
                          ),
                          Text("they get to work.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.figmalightblack)),
                          SizedBox(
                            height: 48,
                          ),
                          SizedBox(
                            width: 260,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  stepone = false;
                                  steptwo = false;
                                  stepthree = true;
                                });
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.figmabutton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          if (stepthree == true)
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, right: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            setState(() {
                              stepone = false;
                              steptwo = true;
                              stepthree = false;
                            });
                          },
                          child: Container(
                              width: 34,
                              height: 34,
                              child: SvgPicture.asset(
                                "assets/images/arrow left.svg",
                                fit: BoxFit.cover,
                                color: AppColor.figmavoilet,
                              )),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.figmasignuptext,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.13,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 375.7,
                        child: SvgPicture.asset(
                          "assets/images/dog_illustrations.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 390.7,
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            if (stepone == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepone == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (steptwo == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (steptwo == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            SizedBox(
                              width: 7.5,
                            ),
                            if (stepthree == false)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmabackgroundstepper,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (stepthree == true)
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColor.figmastepper,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 56.3),
                  child: Column(
                    children: [
                      Text(
                        "Reliable reviews",
                        style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.48),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            "A review can be left only by a user who used",
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.figmalightblack),
                          ),
                          Text("the service.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.figmalightblack)),
                          SizedBox(
                            height: 48,
                          ),
                          SizedBox(
                            width: 260,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegistrationPage();
                                }));
                              },
                              child: Text(
                                "Get started",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.figmabutton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
        ],
      ),
    );
  }
}
