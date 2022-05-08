import 'package:flutter/material.dart';
import '../apihelper/api.dart';
import '../layout/app_layout.dart';
import '../shared/component/components/custom_button.dart';
import 'sign_up_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;

  var formKey = GlobalKey<FormState>();
  var signInEmailController = TextEditingController();
  var signInPasswordController = TextEditingController();

  bool? uiType;

  login() {
    Api().post(
      url: 'Authentication/Login',
      body: {
        "Email": signInEmailController.text,
        "Password": signInPasswordController.text
      },
      // token:
      //     'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI2MSIsInVuaXF1ZV9uYW1lIjoiZ2ciLCJyb2xlIjoiMSIsIm5iZiI6MTY1MjAzMjA4NiwiZXhwIjoxNjUyMTE4NDg2LCJpYXQiOjE2NTIwMzIwODZ9.DNqYcqz4jAARLTM_imesc9h-ULsEhg0mAcS73b8SuS6xL-ywGX-gdLvtGnqJF5RD-QUtRqUrH0UA0Mea8nIuAA',
    );

    if (isSelected1 == true) {
      uiType = true;
    } else {
      uiType = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff22c0e1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  //  height: MediaQuery.of(context).size.height / 4,
                  ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                //  height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Welcome Back!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xff0064b0)),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: signInEmailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xff22c0e1),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: signInPasswordController,
                            obscureText: hidePassword,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff22c0e1),
                              ),
                              suffixIcon: IconButton(
                                icon: hidePassword
                                    ? const Icon(
                                        Icons.visibility_outlined,
                                        color: Color(0xff22c0e1),
                                      )
                                    : const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color(0xff22c0e1),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Forget your Password?',
                                  style: TextStyle(color: Color(0xff0064b0))),
                            ),
                          ),
                          CustomButton(
                            title: 'Sign In',
                            onPress: () async {
                              if (formKey.currentState!.validate()) {
                                await login();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AppLayout(
                                        type: uiType!,
                                      ),
                                    ),
                                    (route) => false);
                                setState(() {});
                              }
                              // await login();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (ctx) {
                              //   return AppLayout(
                              //     type: uiType!,
                              //   );
                              // }));
                              // setState(() {});
                            },
                            textColor: Colors.white,
                            bkColor: const Color(0xff22c0e1),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const SignUp()));
                                },
                                child: const Text(
                                  'Don\'t Have Account? Sign Up Here',
                                  style: TextStyle(color: Color(0xff0064b0)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
