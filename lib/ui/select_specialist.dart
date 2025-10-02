import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../intl/appcolor.dart';
import 'veterinary_card.dart';

class SelectSpecialist extends StatefulWidget {
  final List<Map<String, dynamic>> specialists;
  final String specialty;

  const SelectSpecialist({
    super.key,
    required this.specialists,
    required this.specialty,
  });

  @override
  State<SelectSpecialist> createState() => _SelectSpecialistState();
}

class _SelectSpecialistState extends State<SelectSpecialist> {
  bool specialist = true;
  bool clinic = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredSpecialists = [];

  @override
  void initState() {
    super.initState();
    _filteredSpecialists = widget.specialists;
  }

  void _filterSpecialists(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSpecialists = widget.specialists;
      } else {
        _filteredSpecialists = widget.specialists.where((specialist) {
          final name = specialist['name']?.toString().toLowerCase() ?? '';
          final specialty = specialist['specialty']?.toString().toLowerCase() ?? '';
          final location = specialist['location']?.toString().toLowerCase() ?? '';
          return name.contains(query.toLowerCase()) ||
                 specialty.contains(query.toLowerCase()) ||
                 location.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      color: AppColor.lightgray,
                      blurRadius: 20),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 49),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            "assets/images/arrow left.svg",
                            width: 32,
                            height: 32,
                            color: AppColor.figmavoilet,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 200,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColor.lightgray),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      specialist = true;
                                      clinic = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: specialist
                                          ? AppColor.figmavoilet
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Specialist",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: specialist
                                                ? Colors.white
                                                : AppColor.figmablacktext,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.19),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      specialist = false;
                                      clinic = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: clinic
                                          ? AppColor.figmavoilet
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text("Clinics",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: clinic
                                                  ? Colors.white
                                                  : AppColor.figmablacktext,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.19)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColor.lightgray,
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: _filterSpecialists,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 8, right: 8, bottom: 10),
                          hintText: "Search ${widget.specialty} specialists",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, bottom: 8),
                            child: SvgPicture.asset(
                              "assets/images/find icon.svg",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.figmavoilet,
                          ),
                          child: Center(
                            child: Text(
                              widget.specialty,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${_filteredSpecialists.length} specialists found",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            SizedBox(height: 8),
            if (specialist)
              _filteredSpecialists.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Icon(Icons.search_off, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            "No specialists found",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "Try adjusting your search criteria",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final specialist = _filteredSpecialists[index];
                            return _buildSpecialistCard(specialist);
                          },
                          separatorBuilder: (context, index) {
                            return Container(height: 8);
                          },
                          itemCount: _filteredSpecialists.length),
                    ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialistCard(Map<String, dynamic> specialist) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VeterinaryCard(specialist: specialist),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightgray2,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/Rectangle 2.1.png"),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    specialist['name'] ?? 'Unknown',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.figmablacktext),
                  ),
                  Text(
                    specialist['specialty'] ?? widget.specialty,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.figmablacktext),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "${specialist['rating'] ?? 4.5}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.ratting),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${specialist['experience'] ?? 5} years",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.ratting),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${specialist['consultation_fee'] ?? 25}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.figmavoilet),
                ),
                Text(
                  "${specialist['distance'] ?? 1.5} km",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.ratting),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}