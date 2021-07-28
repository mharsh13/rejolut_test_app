import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.8,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "#${index + 1} ",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: width * 0.7,
                  child: Text(
                    "Leanne Graham",
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: 4,
      ),
    );
  }
}
