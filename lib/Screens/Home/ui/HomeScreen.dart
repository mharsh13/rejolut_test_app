import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/AlbumList.dart';
import 'components/UserDetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Album List",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                UserDetails(height: height, width: width),
                SizedBox(
                  height: height * 0.02,
                ),
                AlbumList(height: height, width: width)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
