import 'package:envision/HeaderListItem.dart';
import 'package:envision/HorizontalNavbar.dart';
import 'package:envision/Payments.dart';
import 'package:envision/Services.dart';
import 'package:envision/details.dart';
import 'package:envision/main.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screen = 'services';
  void changeScreen(tab) {
    setState(() {
      screen = tab;
      print(screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: ,
          selectedItemColor: primary,
          unselectedItemColor: Colors.black26,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: ('main'),
              icon: Icon(FontAwesomeIcons.grip),
            ),
            BottomNavigationBarItem(
              label: ('Bank'),
              icon: Icon(FontAwesomeIcons.bank),
            ),
            BottomNavigationBarItem(
              label: ('Favourite'),
              icon: Icon(FontAwesomeIcons.heart),
            ),
            BottomNavigationBarItem(
              label: ('menu'),
              icon: Icon(FontAwesomeIcons.ellipsis),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Icon(FontAwesomeIcons.qrcode),
          onPressed: (() => {}),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(FontAwesomeIcons.bars),
                        Icon(FontAwesomeIcons.bell)
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'Mbank',
                      style: TextStyle(
                          color: primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [UserDetail(), HeaderList()],
                    ),
                  ),
                  // HorizontalNavbar(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                    child: Container(
                      height: 40,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () => changeScreen('services'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Quick Services',
                                style: screen == 'services'
                                    ? TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)
                                    : null,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => changeScreen('payments'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Payments',
                                style: screen == 'payments'
                                    ? TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)
                                    : null,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Graphs & Charts'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: screen == 'services' ? Services() : Payments(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
