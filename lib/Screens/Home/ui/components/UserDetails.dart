import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:rejolut_test_app/Models/UserModel.dart';
import 'package:rejolut_test_app/Providers/UserIdProvider.dart';

import 'package:rejolut_test_app/Screens/Home/backend/fetchUser.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late int userId;
  UserModel? user;

  @override
  void initState() {
    userId = Provider.of<UserIdProvider>(context, listen: false).userId;
    FetchUser().fetchUser(userId).then((value) {
      user = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return user == null
        ? CircularProgressIndicator(
            color: theme.accentColor,
          )
        : Column(
            children: [
              SizedBox(
                height: widget.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Name: ",
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: widget.width * 0.7,
                      child: Text(
                        "${user!.name}",
                        style: GoogleFonts.montserrat(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Username: ",
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: widget.width * 0.6,
                      child: Text(
                        "${user!.username}",
                        style: GoogleFonts.montserrat(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
