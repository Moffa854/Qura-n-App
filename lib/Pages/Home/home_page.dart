import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../Core/Constant/color_app.dart';
import '../../Core/Widget/create_slide_transation.dart';
import '../../cubit/audio_quraan_cubit.dart';
import '../../cubit/bottom_navigation_bar_cubit.dart';
import '../Start/start_page.dart';
import 'App/Azkar/AzkaarPage/Screens/azkaar_page.dart';
import 'App/PrayerPage/prayer_page.dart';
import 'App/Quraan/InnerPage/Screens/inner_page_quraan.dart';

class HomePage extends StatelessWidget {
  final String? username;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, this.username});

  Future<LocationData?> _getLocation() async {
    try {
      return await _determinePosition();
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  Future<LocationData> _determinePosition() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error('Location permissions are denied');
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<LocationData?>(
        future: _getLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Location not available'));
          }

          LocationData currentPosition = snapshot.data!;

          return Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              width: MediaQuery.of(context).size.width / 1.2,
              backgroundColor: ColorApp.lightPink,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      context.read<AudioCubit>().stopAudio();
                      await FirebaseAuth.instance.signOut().then(
                        (value) {
                          if (context.mounted) {
                            Navigator.of(context).pushReplacement(
                              createSlideTransation(
                                const StartPage(),
                                const Offset(1.0, 0.1),
                              ),
                            );
                          }
                        },
                      );
                    },
                    icon: const Icon(
                      size: 50,
                      Icons.logout,
                      color: ColorApp.purple,
                    ),
                  )
                ],
              ),
            ),
            body: BlocBuilder<BottomNavigationBarCubit, NavigtionBarItem>(
              builder: (context, curentItem) {
                return IndexedStack(
                  index: curentItem.index,
                  children: [
                    const AzkaarPage(),
                    InnerPageQuraan(
                      userName: username,
                      scafoldKey: _scaffoldKey,
                    ),
                    DatePickerPrayerTimes(
                      currentPosition: currentPosition,
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar:
                BlocBuilder<BottomNavigationBarCubit, NavigtionBarItem>(
              builder: (context, curentItem) {
                return CurvedNavigationBar(
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        context
                            .read<BottomNavigationBarCubit>()
                            .updateIndex(NavigtionBarItem.azkaar);
                        break;
                      case 1:
                        context
                            .read<BottomNavigationBarCubit>()
                            .updateIndex(NavigtionBarItem.quraan);
                        break;
                      case 2:
                        context
                            .read<BottomNavigationBarCubit>()
                            .updateIndex(NavigtionBarItem.prayer);
                        break;
                    }
                  },
                  color: ColorApp.purple,
                  backgroundColor: ColorApp.lightPink,
                  items: [
                    Icon(
                      Icons.book_sharp,
                      color: curentItem == NavigtionBarItem.azkaar
                          ? ColorApp.lightPink
                          : ColorApp.heavyPink,
                      size: curentItem == NavigtionBarItem.azkaar ? 40 : 20,
                    ),
                    Icon(
                      Icons.menu_book_sharp,
                      color: curentItem == NavigtionBarItem.quraan
                          ? ColorApp.lightPink
                          : ColorApp.heavyPink,
                      size: curentItem == NavigtionBarItem.quraan ? 40 : 20,
                    ),
                    Icon(
                      Icons.mosque,
                      color: curentItem == NavigtionBarItem.prayer
                          ? ColorApp.lightPink
                          : ColorApp.heavyPink,
                      size: curentItem == NavigtionBarItem.prayer ? 40 : 20,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
