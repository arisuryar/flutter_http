import 'package:flutter/material.dart';
import 'package:flutter_http/constants/color.dart';
import 'package:flutter_http/data/models/user.dart';
import 'package:flutter_http/data/services/service.dart';
import 'package:flutter_http/widgets/dialog.dart';
import 'package:flutter_http/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  late TextEditingController controllerName = TextEditingController();
  late TextEditingController controllerUsername = TextEditingController();
  late TextEditingController controllerPhone = TextEditingController();

  ApiServices apiServices = ApiServices();
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = apiServices.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HTTP PUT'),
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
                    child: FutureBuilder<User?>(
                      future: futureUser,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        User user = snapshot.data!;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${user.name}',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Username : ${user.username}',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Phone : ${user.phone}',
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                  controller: controllerName,
                  label: 'Name',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              MyTextField(
                  controller: controllerUsername,
                  label: 'Username',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              MyTextField(
                  controller: controllerPhone,
                  label: 'Phone',
                  inputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (controllerName.text.isNotEmpty &&
                      controllerUsername.text.isNotEmpty &&
                      controllerPhone.text.isNotEmpty) {
                    setState(() {
                      futureUser = apiServices.updateUser(controllerName.text,
                          controllerUsername.text, controllerPhone.text);

                      controllerName.clear();
                      controllerUsername.clear();
                      controllerPhone.clear();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const DialogWidget(
                                title: 'Success',
                                content: 'Successfully update user');
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
                  'UPDATE USER',
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
}
