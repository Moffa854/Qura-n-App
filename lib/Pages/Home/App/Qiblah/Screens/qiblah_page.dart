// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';

// import '../Widgets/qiblah_compass_widget.dart';

// class QiblahPage extends StatefulWidget {
//   const QiblahPage({super.key});

//   @override
//   State<QiblahPage> createState() => _QiblahPageState();
// }

// class _QiblahPageState extends State<QiblahPage> {
//   final Future<bool?> _deviceSupport =
//       FlutterQiblah.androidDeviceSensorSupport();
//   bool _isSupported = false;

//   @override
//   void initState() {
//     super.initState();
//     // التحقق من دعم المستشعر في البداية
//     _checkDeviceSupport();
//   }

//   Future<void> _checkDeviceSupport() async {
//     final supported = await _deviceSupport;
//     if (supported == true) {
//       setState(() {
//         _isSupported = true;
//       });
//     } else if (supported == false) {
//       setState(() {
//         _isSupported = false;
//       });
//     } else {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("الجهاز لا يدعم مستشعر الاستشعار المغناطيسي."),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // تأكد من التوقف عن الاستماع لمستشعرات القبلة إذا كان الجهاز مدعومًا
//     if (_isSupported == false) {
//       FlutterQiblah().dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اتجاه القبلة'),
//       ),
//       body: _isSupported
//           ? QiblahCompassWidget() // عرض البوصلة إذا كان الجهاز مدعومًا
//           : const Center(
//               child: CircularProgressIndicator()), // عرض مؤشر تحميل فقط
//     );
//   }
// }
