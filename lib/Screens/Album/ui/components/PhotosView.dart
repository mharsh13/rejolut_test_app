import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/Models/PhotoModel.dart';
import '/Providers/AlbumIdProvider.dart';
import '/Screens/Album/backend/fetchData.dart';

import 'ImageView.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({
    Key? key,
  }) : super(key: key);

  @override
  _PhotosViewState createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  late int albumId;
  List<PhotoModel>? photosList;

  @override
  void initState() {
    albumId = Provider.of<AlbumIdProvider>(context, listen: false).albumId;
    FetchData().fetchPhotos(albumId).then((value) {
      photosList = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return photosList == null
        ? Center(
            child: CircularProgressIndicator(
              color: theme.accentColor,
            ),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: photosList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ImageView(
                          photoUrl: photosList![index].url, theme: theme),
                    );
                  },
                  child: Column(
                    children: [
                      ImageView(
                        photoUrl: photosList![index].thumbnail,
                        theme: theme,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          photosList![index].title,
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
