import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/state.dart';
import '../../../modules/doctor/home_doctor.dart';
import '../../../modules/doctor/notifications.dart';
import '../../../modules/patient/home_patient.dart';
import '../../../modules/profile_navigation.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bodyDoctor = [
    DoctorHomeScreen(),
    NotificationScreen(),
    ProfileNavigation(),
  ];
  List<Widget> bodyPatient = [
    PatientHome(),
    NotificationScreen(),
    ProfileNavigation(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(DoctorBottomNavState());
  }

  var bar = [Text('Home',style: TextStyle(color: Colors.white),),
    Text('Notifications',style: TextStyle(color: Colors.white)),
    Text('Profile',style: TextStyle(color: Colors.white))];
}
