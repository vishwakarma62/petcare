import 'package:pet_care/widget/Reviewwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/selectspecialist.dart';
import '../widget/nearbywet.dart';

class VeterinaryCards extends StatefulWidget {
  const VeterinaryCards({super.key});

  @override
  State<VeterinaryCards> createState() => _VeterinaryCardsState();
}

class _VeterinaryCardsState extends State<VeterinaryCards> {
  String selectedOption = 'Option 1';
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  bool isReadmore = false;
  List<SelectspecialistModel> reviewslist = [
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.2.svg",
        id: "1",
        name: "Ann & Leo",
        title: "26.02.2019",
        Reviews: 3,
        years: "",
        amount: "",
        location: ""),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.2.svg",
        id: "1",
        name: "Ann & Leo",
        title: "26.02.2019",
        Reviews: 3,
        years: "",
        amount: "",
        location: ""),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.2.svg",
        id: "1",
        name: "Ann & Leo",
        title: "26.02.2019",
        Reviews: 3,
        years: "",
        amount: "",
        location: ""),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.2.svg",
        id: "1",
        name: "Ann & Leo",
        title: "26.02.2019",
        Reviews: 3,
        years: "",
        amount: "",
        location: ""),
  ];
  List<SelectspecialistModel> nearbylist = [
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.3.svg",
        id: "1",
        name: "Lauren Sell",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10 years of Experience",
        amount: "\$20",
        location: "1.5 km"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.3.svg",
        id: "1",
        name: "Lauren Sell",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10 years of Experience",
        amount: "\$20",
        location: "1.5 km"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.3.svg",
        id: "1",
        name: "Lauren Sell",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10 years of Experience",
        amount: "\$20",
        location: "1.5 km"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.3.svg",
        id: "1",
        name: "Lauren Sell",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10 years of Experience",
        amount: "\$20",
        location: "1.5 km"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.3.svg",
        id: "1",
        name: "Lauren Sell",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10 years of Experience",
        amount: "\$20",
        location: "1.5 km"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 30.0),
      //       child: Container(
      //         //width: 200,
      //         height: 30,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(6),
      //             border: Border.all(color: Colors.white)),
      //         child: DropdownButtonHideUnderline(
      //             child: DropdownButton(
      //                 padding: EdgeInsets.only(right: 16, left: 8),
      //                 iconEnabledColor: Colors.orange,
      //                 value: selectedOption,
      //                 dropdownColor: Colors.black,
      //                 items:
      //                     options.map<DropdownMenuItem<String>>((String value) {
      //                   return DropdownMenuItem<String>(
      //                     value: value,
      //                     child: Text(value,
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                         )),
      //                   );
      //                 }).toList(),
      //                 onChanged: (newvalue) {
      //                   setState(() {
      //                     selectedOption = newvalue!;
      //                   });
      //                 })),
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset("assets/images/Rectangle1.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 49.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                width: 32,
                                height: 32,
                                child: SvgPicture.asset(
                                  "assets/images/arrow left.svg",
                                )),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 269.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                color: AppColor.lightgray,
                                blurRadius: 20,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 14.0, left: 20, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alekseenko Vasily ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.figmablacktext,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.36),
                                  ),
                                  Text("Veterinary Dentist",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.figmablacktext,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text("10 years of experience",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24)),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/wallet.svg"),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text("\$20",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColor.figmablacktext,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.4)),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/map pin.svg"),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "1.5km",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppColor.figmablacktext,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                      //Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 5, right: 17, bottom: 8),
                              child: Column(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.figmavoilet,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "4.9",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  //SizedBox(height: 11,),
                                  Text("125 Reviews",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: AppColor.figmablacktext,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                      )),
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
            ]),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "“He was friendly and diligent in getting to the right diagnosis and presciption.” ",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.figmablacktext,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.16,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "a varified reviews",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        "assets/images/success.svg",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 15,
                        initialRating: 3,
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
                      Spacer(),
                      Text(
                        "View all 125 reviews",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.figmavoilet,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.13),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 20,
                            color: AppColor.lightgray)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16),
                          child: Row(
                            children: [
                              Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColor.lightgray,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      "assets/images/calendar.svg",
                                      color: AppColor.figmablacktext,
                                    ),
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "September",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.figmablacktext,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                  width: 18,
                                  height: 13,
                                  child: SvgPicture.asset(
                                      "assets/images/Arrow.svg")),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(
                          thickness: 2,
                          color: AppColor.lightgray,
                        ),
                        SizedBox(
                            height: 72,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    width: 48,
                                    child: Column(
                                      children: [
                                        Text("$index"),
                                        Text(
                                          "sun",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AppColor.figmablacktext,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.24),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                                itemCount: 12)),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 28,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 68,
                                      decoration: BoxDecoration(
                                        color: AppColor.lightgray,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.figmablacktext,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: ((context, index) {
                                    return SizedBox(
                                      width: 8,
                                    );
                                  }),
                                  itemCount: 12),
                            )),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Biography",
                      style: TextStyle(
                          color: AppColor.figmablacktext,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36)),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text(
                      "Alekseenko Vasily Vasilyevich, born in 1974 Master of Veterinary Medicine Leading doctor Veterinary clinic 'Alden-Vet' Specialization: clinical diagnostics, surgery vet, dentist",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Education",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36)),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text(
                      "Before entering the agricultural Academy he worked at the department of surgery of the veterinary faculty (1991-1992). He graduated from the Faculty of Veterinary Medicine of NAU in 1997. He defended his thesis at the Department of Surgery on the topic : 'Surgery on the urinary organs of cats.' Scientific advisor prof. Borisevich V.B. In 1998 graduated from the Magistracy.",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Professional experience",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36)),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      ListTile(
                        horizontalTitleGap: 8,
                        leading: SvgPicture.asset("assets/images/Ellipse2.svg"),
                        title: Text(
                            "Repeated participant and winner of the International Conferences, reports on the topic: 'Iatrogenic pathology in urology', 'Foreign bodies of the gastrointestinal tract in small domestic animals'",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.figmablacktext,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24)),
                      ),
                      ListTile(
                        horizontalTitleGap: 8,
                        leading: SvgPicture.asset("assets/images/Ellipse2.svg"),
                        title: Text(
                            "From 1998 to 2001, he was the chief physician of the Equus veterinary medicine clinic.",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.figmablacktext,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24)),
                      ),
                      ListTile(
                        horizontalTitleGap: 8,
                        leading: SvgPicture.asset("assets/images/Ellipse2.svg"),
                        title: Text(
                            "Constantly increases the level of his qualifications, attending international conferences, congresses, workshops on veterinary services for small pets.",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.figmablacktext,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24)),
                      ),
                      ListTile(
                        horizontalTitleGap: 8,
                        leading: SvgPicture.asset("assets/images/Ellipse2.svg"),
                        title: Text(
                            "Since 2006, the leading doctor of veterinary care 'UCCA'. At the same time, she continues to conduct reception at the Equus veterinary medicine clinic, where he has been working since 1997.",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColor.figmablacktext,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Personal information",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColor.figmablacktext,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.34),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text(
                        "Candidate master of sports in equestrian sport (dressage). Favorite breed of dog is German Shepherd. He is married, has two children: daughter Alika and son Timur.",
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColor.figmablacktext,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.figmablacktext,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.36),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "View all 125 reviews",
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColor.figmavoilet,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.13),
                          ),
                          SizedBox(
                            width: 8.07,
                          ),
                          SvgPicture.asset(
                            "assets/images/Arrow.svg",
                            color: AppColor.figmavoilet,
                            width: 5,
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 215,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ReviewsWidget(reviews: reviewslist[index]);
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: 16,
                          );
                        },
                        itemCount: reviewslist.length),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.lightgray,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/edit pen file.svg"),
                    SizedBox(
                      width: 7.97,
                    ),
                    Text(
                      "Write a Review",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.figmavoilet),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    "Nearby vet",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.36),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 215,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NearbyVetwidget(nearbyvet: nearbylist[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: 16,
                    );
                  },
                  itemCount: nearbylist.length),
            ),
          ],
        ),
      ),
    );
  }
}
