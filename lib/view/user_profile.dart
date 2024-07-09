import 'package:flutter/material.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/hs_new_ui.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final h1 = MediaQuery.of(context).size.height;
    final w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill Your Profile",
          style: TextConst.titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                // color: Colors.amber,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "   username*",
                  style: TextConst.headingui,
                ),
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: "username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    gapPadding: 50,
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "   Full name*",
                  style: TextConst.headingui,
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: "fullname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    gapPadding: 50,
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "   Email*",
                  style: TextConst.headingui,
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    gapPadding: 50,
                  ),
                  suffixIcon: Icon(Icons.email),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "   Phone number*",
                  style: TextConst.headingui,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  hintText: "phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.black,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    gapPadding: 50,
                  ),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    //

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          Container(
                            height: h1 / 2,
                            width: w1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: w1 / 6,
                                  backgroundColor: Colors.black,
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle_rounded,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                    "Great!\nYour account has been \n created successfully",
                                    textAlign: TextAlign.center,
                                    style: TextConst.headingui),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewHomeScreen(),
                                        ));
                                  },
                                  child: Container(
                                    height: 55,
                                    width: w1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Go to Home",
                                        style: TextConst.buttnText,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      barrierColor: Colors.black26,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "continue",
                        style: TextConst.buttnText,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
