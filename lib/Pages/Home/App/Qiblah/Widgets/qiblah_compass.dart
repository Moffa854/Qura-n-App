// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// import 'package:geolocator/geolocator.dart';

// import 'location_error_widget.dart';
// import 'qiblah_compass_widget.dart';

// class QiblahCompass extends StatefulWidget {
//   const QiblahCompass({super.key});

//   @override
//   _QiblahCompassState createState() => _QiblahCompassState();
// }

// class _QiblahCompassState extends State<QiblahCompass> {
//   final _locationStreamController =
//       StreamController<LocationStatus>.broadcast();
//   late StreamSubscription _subscription;
//   bool _isSupported = false;
//   final bool _compassErrorLogged = false; // Flag to prevent multiple error logs

//   Future<void> _checkLocationStatus() async {
//     final locationStatus = await FlutterQiblah.checkLocationStatus();
//     if (locationStatus.enabled &&
//         locationStatus.status == LocationPermission.denied) {
//       await FlutterQiblah.requestPermissions();
//       final s = await FlutterQiblah.checkLocationStatus();
//       _locationStreamController.sink.add(s);
//     } else {
//       _locationStreamController.sink.add(locationStatus);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _checkLocationStatus();
//     _subscription = FlutterQiblah.androidDeviceSensorSupport()
//         .asStream()
//         .listen((supported) {
//       if (supported == true) {
//         setState(() {
//           _isSupported = true;
//         });
//       } else {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           Navigator.of(context).pop(); // Close the page if not supported
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _subscription.cancel(); // Cancel the subscription
//     _locationStreamController.close(); // Close the stream controller
//     FlutterQiblah().dispose(); // Dispose Qiblah resources
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isSupported
//           ? Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(8.0),
//               child: StreamBuilder<LocationStatus>(
//                 stream: _locationStreamController.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   if (snapshot.data!.enabled) {
//                     switch (snapshot.data!.status) {
//                       case LocationPermission.always:
//                       case LocationPermission.whileInUse:
//                         return QiblahCompassWidget();

//                       case LocationPermission.denied:
//                         return LocationErrorWidget(
//                           error: "Location service permission denied",
//                           callback: _checkLocationStatus,
//                         );
//                       case LocationPermission.deniedForever:
//                         return LocationErrorWidget(
//                           error: "Location service Denied Forever!",
//                           callback: _checkLocationStatus,
//                         );
//                       default:
//                         return Container();
//                     }
//                   } else {
//                     return LocationErrorWidget(
//                       error: "Please enable Location service",
//                       callback: _checkLocationStatus,
//                     );
//                   }
//                 },
//               ),
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }
