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
    return Scaffold(
      body: SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(width: 10,);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: Colors.red
            ),
          child: Center(child: Text('igyh')),
        );
        },),
      )
    );
  }
}