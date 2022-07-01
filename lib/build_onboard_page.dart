import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildOnBoardPage(
    {required String image,
    required String title,
    required String subtitle,
    required Color clr}) {
  return Container(
    color: clr,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          width: 350,
          height: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
