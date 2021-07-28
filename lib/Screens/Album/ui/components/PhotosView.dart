import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  List<PhotoModel> photosList = [];

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
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: StaggeredGridView.countBuilder(
        physics: AlwaysScrollableScrollPhysics(),
        crossAxisCount: 4,
        itemCount: photosList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.network(
                  photosList[index].thumbnail,
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
