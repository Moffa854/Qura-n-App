import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../Widgets/qiblah_compass.dart';

class QiblahPage extends StatefulWidget {
  const QiblahPage({super.key});

  @override
  State<QiblahPage> createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  final Future<bool?> _deviceSupport =
      FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool?>(
        future: _deviceSupport,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('Your Device hardware doesn’t support the sensor'));
          }
          // Check for null value and use fallback for unsupported devices
          if (snapshot.data == true) {
            return const QiblahCompass();
          } else {
            return const Center(child: Text("Your device is not supported"));
          }
        },
      ),
    );
  }
}
