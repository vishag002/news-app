import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/home_screen_controler.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/user_profile.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  int? selectedTileIndex;
  //

  Future<void> getCountry() async {
    Provider.of<HomeScreenController>(context, listen: false).countries;
  }

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenController =
        Provider.of<HomeScreenController>(context).countries;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Your Country",
          style: TextConst.titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: homeScreenController.length,
          itemBuilder: (context, index) => Card(
            shape: selectedTileIndex == index
                ? RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  )
                : null,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedTileIndex = index;
                });
              },
              child: ListTile(
                title: Text(homeScreenController[index]['name'].toString()),
                leading: CircleAvatar(
                  radius: 30,
                  child: CountryFlag.fromCountryCode(
                    homeScreenController[index]['code'].toString(),
                    shape: Circle(),
                    height: 50,
                    width: 50,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    selectedTileIndex == index
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                  ),
                  onPressed: () {
                    setState(() {
                      print(index);
                      selectedTileIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (selectedTileIndex != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please select a country before proceeding.'),
              ),
            );
          }
        },
        child: BottomAppBar(
          color: Colors.black,
          height: 65,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Center(
            child: Text(
              "Next",
              style: TextConst.buttnText,
            ),
          ),
        ),
      ),
    );
  }
}
