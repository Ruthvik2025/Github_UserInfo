import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsUI extends StatefulWidget {
  const DetailsUI({super.key});

  @override
  State<DetailsUI> createState() => _DetailsUIState();
}

class _DetailsUIState extends State<DetailsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 55,
                        backgroundImage: AssetImage("assets/git.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "UserName",
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "8",
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall),
                          ),
                          // SizedBox(
                          //   height: 4,
                          // ),
                          Text(
                            "Followers",
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text(
                            "8",
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Followers",
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
