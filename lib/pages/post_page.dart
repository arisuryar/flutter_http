import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:flutter_http/data/models/user.dart';
import 'package:flutter_http/data/services/service.dart';
import 'package:flutter_http/widgets/dialog.dart';
import 'package:flutter_http/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPage extends StatefulWidget {
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  ApiServices apiServices = ApiServices();
  Future<User>? futureUser;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerName.dispose();
    controllerUsername.dispose();
    controllerPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HTTP GET'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 200,
                child: Card(
                  child: Center(
                    child: (futureUser == null)
                        ? const buildNoData()
                        : buildFutureUser(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  label: 'Name',
                  controller: controllerName,
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              MyTextField(
                  label: 'Username',
                  controller: controllerUsername,
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              MyTextField(
                label: 'Phone',
                controller: controllerPhone,
                inputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (controllerName.text.isNotEmpty &&
                      controllerUsername.text.isNotEmpty &&
                      controllerPhone.text.isNotEmpty) {
                    setState(() {
                      futureUser = apiServices.createUser(controllerName.text,
                          controllerUsername.text, controllerPhone.text);

                      controllerName.clear();
                      controllerUsername.clear();
                      controllerPhone.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const DialogWidget(
                                title: 'Success',
                                content: 'Successfully create a user');
                          });
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const DialogWidget(
                            title: 'An Error Occurred',
                            content: 'Data cannot be empty');
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'CREATE USER',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<User> buildFutureUser() {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name : ${snapshot.data!.name}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Username : ${snapshot.data!.username}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone : ${snapshot.data!.phone}',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ],
        );
      },
    );
  }
}

// ignore: camel_case_types
class buildNoData extends StatelessWidget {
  const buildNoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name : ',
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Username : ',
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Phone : ',
          style: GoogleFonts.poppins(fontSize: 18),
        ),
      ],
    );
  }
}
