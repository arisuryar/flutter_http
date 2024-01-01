import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:flutter_http/data/models/user.dart';
import 'package:flutter_http/data/services/service.dart';
import 'package:google_fonts/google_fonts.dart';

class GetPage extends StatefulWidget {
  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  ApiServices apiServices = ApiServices();
  User? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HTTP GET'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 200,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : ${userData?.name ?? ''}',
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Username : ${userData?.username ?? ''}',
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Phone : ${userData?.phone ?? ''}',
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              apiServices.getUser().then((value) {
                setState(() {
                  userData = value;
                });
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'GET DATA USER',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
