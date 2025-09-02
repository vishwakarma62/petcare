import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
             // width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  GridView.count(
                    padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          crossAxisCount: 3, // Display 3 items per row
                          mainAxisSpacing: 8, // Adjust the spacing between rows
                          crossAxisSpacing: 8, // Adjust the spacing between columns
                          children: List.generate(10, (index) {
                            return Container(
                              width: 10,
                              height: 10,
                              color: Colors.green,
                            );
                          }),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}