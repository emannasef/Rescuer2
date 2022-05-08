import 'package:flutter/material.dart';
import '../modules/doctor/personal_doctor.dart';

//build home layout
Widget buildMenuItem({
  required String text,
  required IconData icon,
  required Function function,
  Color iconColor = const Color(0xFF6D6F6F),
}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: iconColor,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 20, color: iconColor),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    ),
  );
}

void selectItem(context, int index) {
  //Navigator.pop(context);
  switch (index) {
    case 0:
      navigateTo(context, ProfileDoctor());
      break;
  }
}

void navigateTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

//build doctor & patient

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTab,
  bool isPassword = false,
  // required String? Function(String?)? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: () {
        onTab!();
      },
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      // validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 15.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
Widget buildImageCross() => Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 60.0,
            //   backgroundImage: NetworkImage(
            //       'https://avatars.githubusercontent.com/u/34492145?v=4'),
            //
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 19.0,
            backgroundColor: Colors.white,
            // child: Icon(
            //   Icons.camera_alt,
            //   size: 20,
            //   color: Colors.white,
            // ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
