import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/welcome_screen.dart';
import 'shared/cubit/cubit_doctor/cubit.dart';
import 'shared/cubit/cubit_doctor/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorCubit()),
      ],
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Rescuer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              primaryIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.cyan,
              ),
            ),
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
