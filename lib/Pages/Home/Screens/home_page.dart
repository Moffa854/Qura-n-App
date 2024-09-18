import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../Core/Constant/color_app.dart';
import '../../../Core/Widget/create_slide_transation.dart';
import '../../../cubit/Audio/audio_quraan_cubit.dart';
import '../../../cubit/Bottom Navigation/bottom_navigation_bar_cubit.dart';
import '../../Start/Screens/start_page.dart';
import '../App/Azkar/AzkaarPage/Screens/azkaar_page.dart';
import '../App/PrayerPage/Screens/prayer_page.dart';
import '../App/Quraan/InnerPage/Screens/inner_page_quraan.dart';
import '../Widgets/three_elevated_buttom.dart';

class HomePage extends StatelessWidget {
  final String? username;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, this.username});

  Future<LocationData?> _getLocation() async {
    final location = Location();

    try {
      // التأكد من تفعيل خدمات الموقع
      if (!await _ensureLocationService(location)) return null;

      // التحقق من الأذونات
      if (!await _checkLocationPermission(location)) return null;

      // الحصول على بيانات الموقع
      return await location.getLocation();
    } catch (e) {
      return Future.error('Error: $e');
    }
  }

  Future<bool> _ensureLocationService(Location location) async {
    if (!await location.serviceEnabled()) {
      return await location.requestService();
    }
    return true;
  }

  Future<bool> _checkLocationPermission(Location location) async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
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
            drawer: buildDrawer(context),
            body: _buildBody(context, currentPosition),
            bottomNavigationBar: _buildBottomNavigationBar(context),
          );
        },
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.2,
      backgroundColor: ColorApp.lightPink,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 30),
        child: Column(
          children: [
            const ThreeElevatedButtom(),
            IconButton(
              onPressed: () async {
                await signOut(context);
              },
              icon: const Icon(
                size: 50,
                Icons.logout,
                color: ColorApp.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await context.read<AudioCubit>().stopAudio();
    await FirebaseAuth.instance.signOut().then((_) {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          createSlideTransation(
            const StartPage(),
            const Offset(1.0, 0.1),
          ),
        );
      }
    });
  }

  Widget _buildBody(BuildContext context, LocationData currentPosition) {
    return BlocBuilder<BottomNavigationBarCubit, NavigtionBarItem>(
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
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, NavigtionBarItem>(
      builder: (context, curentItem) {
        return CurvedNavigationBar(
          onTap: (index) => _onNavigationItemTapped(context, index),
          color: ColorApp.purple,
          backgroundColor: ColorApp.lightPink,
          items: _buildNavigationItems(curentItem),
        );
      },
    );
  }

  void _onNavigationItemTapped(BuildContext context, int index) {
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
  }

  List<Widget> _buildNavigationItems(NavigtionBarItem curentItem) {
    return [
      Icon(
        Icons.book_sharp,
        color: curentItem == NavigtionBarItem.azkaar
            ? ColorApp.lightPink
            : ColorApp.heavyPink,
        size: curentItem == NavigtionBarItem.azkaar ? 30 : 20,
      ),
      Icon(
        Icons.menu_book_sharp,
        color: curentItem == NavigtionBarItem.quraan
            ? ColorApp.lightPink
            : ColorApp.heavyPink,
        size: curentItem == NavigtionBarItem.quraan ? 30 : 20,
      ),
      Icon(
        Icons.mosque,
        color: curentItem == NavigtionBarItem.prayer
            ? ColorApp.lightPink
            : ColorApp.heavyPink,
        size: curentItem == NavigtionBarItem.prayer ? 30 : 20,
      ),
    ];
  }
}
