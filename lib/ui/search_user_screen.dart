import 'dart:math';

import 'package:pet_care/model/search_model.dart';
import 'package:pet_care/widget/popularspecialist_widget.dart';
import 'package:pet_care/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/popularspecialist.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchModel> searchlist = [
    SearchModel(IMG: "assets/images/vet.svg", name: "Veterinary"),
    SearchModel(IMG: "assets/images/grooming.svg", name: "Grooming"),
    SearchModel(IMG: "assets/images/boarding.svg", name: "Pet boarding"),
    SearchModel(IMG: "assets/images/adoption.svg", name: "Adoption"),
    SearchModel(IMG: "assets/images/dog walking.svg", name: "Dog walking"),
    SearchModel(IMG: "assets/images/training.svg", name: "Training"),
    SearchModel(IMG: "assets/images/taxi.svg", name: "Pet taxi"),
    SearchModel(IMG: "assets/images/date.svg", name: "Pet data"),
    SearchModel(IMG: "assets/images/other.svg", name: "Other"),
  ];

  List<Popular> popularlist = [
    Popular(tittle: "Cat Specialist"),
    Popular(tittle: "Dog Specialist"),
    Popular(tittle: "Ornithologist"),
    Popular(tittle: "Dentist"),
    Popular(tittle: "Surggeon"),
  ];

  List<Popular> Allspecialistlist = [
    Popular(tittle: "Veterinarian"),
    Popular(tittle: "Therapist"),
    Popular(tittle: "Anesthetist"),
    Popular(tittle: "Gastroenterologist"),
    Popular(tittle: "Infectious desease"),
    Popular(tittle: "Cardiologist"),
    Popular(tittle: "Nurologist"),
    Popular(tittle: "Oncologist"),
    Popular(tittle: "Ornithologist"),
    Popular(tittle: "Orthopedist"),
    Popular(tittle: "Opthalmologist"),
    Popular(tittle: "Radiologist"),
    Popular(tittle: "Dentist"),
    Popular(tittle: "Therapist"),
    Popular(tittle: "Traumatologist"),
    Popular(tittle: "Surgeon"),
    Popular(tittle: "Dog Specialist"),
    Popular(tittle: "Ornithologist"),
    Popular(tittle: "Dentist"),
    Popular(tittle: "Surggeon"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 53),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/images/find icon.svg"),
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What are you",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: AppColor.figmablacktext),
                  ),
                  Row(
                    children: [
                      Text("looking for,",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: AppColor.figmablacktext)),
                      Text("Maria?",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.yellow)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3, // Display 3 items per row
                mainAxisSpacing: 8, // Adjust the spacing between rows
                crossAxisSpacing: 16, // Adjust the spacing between columns
                children: List.generate(searchlist.length, (index) {
                  return InkWell(highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: SearchWidget(search: searchlist[index]));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,

      shape: RoundedRectangleBorder(
        // Define the shape
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
      backgroundColor: Colors.white,
      //isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 36.0, left: 18, right: 42),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  "assets/images/close icon.svg",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Spacer(),
                          Text(
                            "Select a speciality",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: AppColor.figmablacktext,
                                letterSpacing: 0.39),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Text("Popular specialties",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.orange,
                              letterSpacing: 1.5)),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PopularSpecialist(
                                popular: popularlist[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 6,
                            );
                          },
                          itemCount: popularlist.length),
                      SizedBox(
                        height: 32,
                      ),
                      Text("All specialties",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.orange,
                              letterSpacing: 1.5)),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PopularSpecialist(
                                popular: Allspecialistlist[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 6,
                            );
                          },
                          itemCount: Allspecialistlist.length),
                          
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
