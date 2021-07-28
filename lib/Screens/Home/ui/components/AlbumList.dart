import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rejolut_test_app/Models/AlbumModel.dart';
import 'package:rejolut_test_app/Providers/AlbumIdProvider.dart';
import 'package:rejolut_test_app/Providers/UserIdProvider.dart';
import 'package:rejolut_test_app/Screens/Album/ui/AlbumScreen.dart';
import 'package:rejolut_test_app/Screens/Home/backend/fetchData.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<AlbumModel>? albumList;
  late int userId;

  @override
  void initState() {
    userId = Provider.of<UserIdProvider>(context, listen: false).userId;
    FetchData().fetchAlbumList(userId).then((value) {
      albumList = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: widget.height * 0.8,
      child: albumList == null
          ? Center(
              child: CircularProgressIndicator(
                color: theme.accentColor,
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Provider.of<AlbumIdProvider>(context, listen: false)
                      .setAlbumId(int.parse(albumList![index].id));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AlbumScreen(),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: widget.width,
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
                        SizedBox(
                          width: widget.width * 0.02,
                        ),
                        Container(
                          width: widget.width * 0.7,
                          child: Text(
                            "${albumList![index].title}",
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
              ),
              itemCount: albumList!.length,
            ),
    );
  }
}
