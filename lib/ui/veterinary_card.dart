import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../intl/appcolor.dart';

class VeterinaryCard extends StatefulWidget {
  final Map<String, dynamic> specialist;

  const VeterinaryCard({super.key, required this.specialist});

  @override
  State<VeterinaryCard> createState() => _VeterinaryCardState();
}

class _VeterinaryCardState extends State<VeterinaryCard> {
  @override
  Widget build(BuildContext context) {
    final specialist = widget.specialist;
    
    return Scaffold(
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
                                    specialist['name'] ?? 'Unknown Specialist',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.figmablacktext,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.36),
                                  ),
                                  Text(specialist['specialty'] ?? 'Veterinarian',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.figmablacktext,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text("${specialist['experience'] ?? 5} years of experience",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24)),
                                  SizedBox(height: 9),
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/images/wallet.svg"),
                                      SizedBox(width: 12),
                                      Text("\$${specialist['consultation_fee'] ?? 25}",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColor.figmablacktext,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.4)),
                                      SizedBox(width: 14),
                                      SvgPicture.asset("assets/images/map pin.svg"),
                                      SizedBox(width: 12),
                                      Text(
                                        "${specialist['distance'] ?? 1.5}km",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppColor.figmablacktext,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
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
                                        "${specialist['rating'] ?? 4.5}",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text("${specialist['review_count'] ?? 125} Reviews",
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
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      specialist['bio'] ?? "Professional veterinary specialist with years of experience.",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.figmablacktext,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.16,
                      )),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "verified specialist",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24),
                      ),
                      SizedBox(width: 8),
                      SvgPicture.asset("assets/images/success.svg"),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemSize: 15,
                        initialRating: (specialist['rating'] ?? 4.5).toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Spacer(),
                      Text(
                        "View all ${specialist['review_count'] ?? 125} reviews",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.figmavoilet,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.13),
                      )
                    ],
                  ),
                  SizedBox(height: 34),
                  // Appointment booking section
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                              SizedBox(width: 16),
                              Text(
                                "Book Appointment",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.figmablacktext,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.figmavoilet,
                            ),
                            child: Center(
                              child: Text(
                                "Schedule Appointment",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text("About",
                      style: TextStyle(
                          color: AppColor.figmablacktext,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36)),
                  SizedBox(height: 16),
                  Container(
                    child: Text(
                      specialist['description'] ?? 
                      "Experienced veterinary professional dedicated to providing the best care for your pets. Specialized in various treatments and procedures.",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text("Services",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.figmablacktext,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.36)),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (specialist['services'] as List<dynamic>?)?.map<Widget>((service) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColor.lightgray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          service.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.figmablacktext,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList() ?? [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColor.lightgray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "General Consultation",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.figmablacktext,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}