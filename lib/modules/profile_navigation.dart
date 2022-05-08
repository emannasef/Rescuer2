import 'package:flutter/material.dart';


import '../dialogs/privacy_policy_dialog.dart';
import '../shared/components3.dart';

class ProfileNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              width: 200,
              height: 170,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/person.png',
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'My Name',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                text: "Personal Information",
                icon: Icons.person_outline_outlined,
                function: () {
                  selectItem(context, 0);
                }),
            buildMenuItem(
                text: "Notifications",
                icon: Icons.notifications_none_outlined,
                function: () {}),
            buildMenuItem(
                text: "Language",
                icon: Icons.language,
                function: () {
                  selectItem(context, 0);
                }),
            buildMenuItem(
                text: 'Help Center', icon: Icons.help_outline, function: () {}),
            buildMenuItem(text: 'About Us', icon: Icons.group, function: () {}),
            buildMenuItem(
                text: 'Terms & Conditions',
                icon: Icons.note_add_rounded,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              PolicyDialog(fileName: 'terms_conditions.md')));
                }),
            buildMenuItem(
                text: 'Log Out',
                iconColor: Colors.red,
                icon: Icons.logout,
                function: () {}),
          ],
        ),
      ),
    );
  }
}
