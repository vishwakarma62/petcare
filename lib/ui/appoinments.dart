import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../intl/appcolor.dart';

class Appoinments extends StatefulWidget {
  const Appoinments({super.key});

  @override
  State<Appoinments> createState() => _AppoinmentsState();
}

class _AppoinmentsState extends State<Appoinments> {
  bool upcomming = true;
  bool past = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 176,
           decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.lightgray2,
                offset: Offset(0, 40),
                blurRadius: 20,
              )
            ],
             color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
           ),
            child: Column(
              children: [
                const SizedBox(
                  height: 53,
                ),
                const Text(
                  "Appoinment",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.figmablacktext,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.stepper),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                upcomming = true;
                                past = false;
                              });
                            },
                            child: Container(
                              //height: 38,
                              decoration: BoxDecoration(
                                color: upcomming
                                    ? AppColor.figmavoilet
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Upcomming",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: upcomming
                                            ? Colors.white
                                            : AppColor.figmablacktext)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                upcomming = false;
                                past = true;
                              });
                            },
                            child: Container(
                              //height: 38,
                              decoration: BoxDecoration(
                                color:
                                    past ? AppColor.figmavoilet : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Past",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: past
                                            ? Colors.white
                                            : AppColor.figmablacktext)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32,),
        
          if (past == true)
            Expanded(
              child: Container(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 120,
                            height: 120,
                            child: SvgPicture.asset(
                              "assets/images/icon clock.svg",
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          height: 11,
                        ),
                        const Text(
                          "No appointments yet",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.19,
                              color: AppColor.figmadevider),
                        ),
                        const SizedBox(height: 200),
                        Container(
                          width: 240,
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColor.figmavoilet,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                              child: Text(
                            "Find a specialist",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal),
                          )),
                        ),
                        const SizedBox(
                          height: 58,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
         
          if (upcomming == true)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 318,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: AppColor.lightgray2,
                                blurRadius: 6,
                                offset: Offset(0, 4)),
                            BoxShadow(
                                color: AppColor.lightgray2,
                                blurRadius: 6,
                                offset: Offset(12, 0)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, bottom: 24),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 88,
                                    height: 88,
                                    child: Image.asset(
                                      "assets/images/Rectangle 2.1.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Alekseenko Vasily ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 0.39,
                                              color: AppColor.figmablacktext),
                                        ),
                                        const Text("Veterinary Dentist",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                color: AppColor.figmablacktext)),
                                        Row(
                                          children: [
                                            SvgPicture.asset("assets/images/5.svg"),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text("125 Reviews",
                                                style: TextStyle(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppColor.ratting,
                                                    letterSpacing: 0.9)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: AppColor.lightgray,
                                                radius: 16,
                                                child: SvgPicture.asset(
                                                    "assets/images/map pin.svg")),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            const Text("1.5 km",
                                                style: TextStyle(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppColor.figmablacktext,
                                                    letterSpacing: 0.9)),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            CircleAvatar(
                                                backgroundColor: AppColor.lightgray,
                                                radius: 16,
                                                child: SvgPicture.asset(
                                                    "assets/images/wallet.svg")),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            const Text("\$20",
                                                style: TextStyle(
                                                    fontSize: 12.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppColor.figmablacktext,
                                                    letterSpacing: 0.9)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 112,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.lightgray2,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 16, bottom: 16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: AppColor.lightgray,
                                                radius: 16,
                                                child: SvgPicture.asset(
                                                    "assets/images/work.svg")),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Veterinary clinic 'Alden-Vet' ",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FontStyle.normal,
                                                        color:
                                                            AppColor.figmablacktext,
                                                      )),
                                                  Text(
                                                      "141 N Union Ave, Los Angeles, CA",
                                                      style: TextStyle(
                                                          fontSize: 12.5,
                                                          fontWeight: FontWeight.w500,
                                                          fontStyle: FontStyle.normal,
                                                          color:
                                                              AppColor.figmablacktext,
                                                          letterSpacing: 0.29)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundColor: AppColor.lightgray,
                                                radius: 16,
                                                child: SvgPicture.asset(
                                                    "assets/images/icon clock2.svg")),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.0),
                                              child: Text("Wed 9 Sep — 10:30 am",
                                                  style: TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      color: AppColor.figmablacktext,
                                                      letterSpacing: 0.29)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 23.0,right: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      // width: 140,
                                      // height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColor.figmavoilet,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal:47.5,vertical: 7),
                                        child: Center(
                                          child: Text("Edit",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      // width: 140,
                                      // height: 34,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColor.lightgray2,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 47.5,vertical: 7),
                                        child: Center(
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                color: AppColor.figmablacktext,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
