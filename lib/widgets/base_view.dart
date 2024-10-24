import 'package:flutter/material.dart';

import '../app/modules/home/views/home_view_page.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key, required this.body, required this.title});

  final Widget body;
  final String title;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8242),
        title: Container(
          height: 190, // Adjust the height as needed
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40), // Adjust corner radius
              bottomRight: Radius.circular(40), // Adjust corner radius
            ),
            color: Color(0xFFFF8242),
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22, // Adjust font size
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(), // Adds space between the text and profile photo

              CircleAvatar(
                child: Container(
                  color: Colors.white,
                ),
              )
              // CircleAvatar(
              //   radius: 18, // Adjust the radius as needed
              //   backgroundImage: Image.asset(),
              // ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(child: widget.body),
    );
  }
}
