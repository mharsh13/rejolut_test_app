import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rejolut_test_app/Models/PhotoModel.dart';
import 'package:rejolut_test_app/Providers/AlbumIdProvider.dart';
import 'package:rejolut_test_app/Screens/Album/backend/fetchData.dart';

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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: photosList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: Image.network(
                        photosList![index].thumbnail,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 75),
                              child: CircularProgressIndicator(
                                backgroundColor: theme.accentColor,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        num.parse(loadingProgress
                                            .expectedTotalBytes
                                            .toString())
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
