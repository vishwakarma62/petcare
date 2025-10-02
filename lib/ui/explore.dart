import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    List<String> sampleData = List.generate(10, (index) => "This is item number $index, and it has a total of 100 characters in it which is more than enough.");
    return Center(
      child: Text("Explore Page"),
    );
  }
}