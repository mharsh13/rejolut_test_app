import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosView extends StatefulWidget {
  const PhotosView({
    Key? key,
  }) : super(key: key);

  @override
  _PhotosViewState createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: StaggeredGridView.countBuilder(
        physics: AlwaysScrollableScrollPhysics(),
        crossAxisCount: 4,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.network(
                  "https://i.picsum.photos/id/755/200/300.jpg?hmac=CfzLROBA3atEQnBKXK5SeavNo-1QRwZRwcqZwwdBMdM",
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
