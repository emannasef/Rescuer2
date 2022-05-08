import 'package:flutter/material.dart';

import '../../shared/components3.dart';


class ProfileDoctor extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var painController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            buildImageCross(),
            SizedBox(
              height: 20,
            ),
            defaultFormField(
              prefix: Icons.title,
              controller: nameController,
              type: TextInputType.text,
              label: 'Full Name',
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
              prefix: Icons.phone,
              controller: phoneController,
              type: TextInputType.phone,
              label: 'Phone',
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
              prefix: Icons.email,
              controller: emailController,
              type: TextInputType.emailAddress,
              label: 'Email',
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
              controller: ageController,
              type: TextInputType.number,
              label: 'Age',
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
              controller: painController,
              type: TextInputType.text,
              label: 'Major',
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(function: () {}, text: 'Save'),
          ],
        ),
      ),
    );
  }
}
