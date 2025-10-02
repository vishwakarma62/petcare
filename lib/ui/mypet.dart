import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/service_manager.dart';
import '../services/token_storage.dart';
import '../intl/appcolor.dart';

class MyPet extends StatefulWidget {
  const MyPet({super.key});

  @override
  State<MyPet> createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  final ServiceManager _serviceManager = ServiceManager();
  List<Map<String, dynamic>> _pets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPets();
  }

  Future<void> _fetchPets() async {
    try {
      final userId = await TokenStorage.getUserId();
      if (userId != null) {
        final pets = await _serviceManager.petService.getPetsByOwner(userId);
        setState(() {
          _pets = pets;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching pets: $e');
    }
  }

  Future<void> _deletePet(Map<String, dynamic> pet) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Pet'),
        content: Text('Are you sure you want to delete ${pet['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _serviceManager.petService.deletePet(pet['id']);
        _fetchPets(); // Refresh list
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${pet['name']} deleted successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting pet: $e')),
        );
      }
    }
  }

  Widget _buildPetCard(Map<String, dynamic> pet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: GestureDetector(
        onLongPress: () => _deletePet(pet),
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
                padding: const EdgeInsets.only(left: 24.0, top: 24, right: 24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => _deletePet(pet),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        final result = await Navigator.pushNamed(
                          context, 
                          '/edit-pet',
                          arguments: pet,
                        );
                        if (result == true) {
                          _fetchPets(); // Refresh pets list
                        }
                      },
                      child: Row(
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage("assets/images/Ellipse.png"),
              ),
              SizedBox(height: 24),
              Text(
                pet['name'] ?? 'Unknown',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.49,
                    color: AppColor.figmablacktext,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                pet['breed'] ?? 'Unknown breed',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.19,
                    color: AppColor.lightgray,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetsList() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _pets.length,
          itemBuilder: (context, index) {
            return _buildPetCard(_pets[index]);
          },
        ),
      ],
    );
  }

  Widget _buildNoPetsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No pets yet",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Add your first pet below",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.pushNamed(context, '/add-pet');
                      if (result == true) {
                        _fetchPets(); // Refresh pets list
                      }
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        "assets/images/plus add.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _pets.isEmpty
                    ? _buildNoPetsWidget()
                    : _buildPetsList(),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: () async {
                  final result = await Navigator.pushNamed(context, '/add-pet');
                  if (result == true) {
                    _fetchPets(); // Refresh pets list
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppColor.lightgray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13.0, bottom: 13),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            "assets/images/plus add.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Add another pet",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.19,
                              color: AppColor.figmavoilet,
                              fontStyle: FontStyle.normal),
                        ),
                        Spacer(),
                      ],
                    ),
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
