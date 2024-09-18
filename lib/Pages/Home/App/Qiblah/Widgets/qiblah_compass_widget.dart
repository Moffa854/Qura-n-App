// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// import 'package:flutter_svg/svg.dart';

// class QiblahCompassWidget extends StatelessWidget {
//   final _compassSvg = SvgPicture.asset('assets/svg/compass.svg');
//   final _needleSvg = SvgPicture.asset(
//     'assets/svg/needle.svg',
//     fit: BoxFit.contain,
//     height: 300,
//     alignment: Alignment.center,
//   );

//   QiblahCompassWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QiblahDirection>(
//       stream: FlutterQiblah.qiblahStream,
//       builder: (_, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: Text("Unable to determine direction."));
//         }

//         final qiblahDirection = snapshot.data!;

//         return Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Transform.rotate(
//               angle: (qiblahDirection.direction * (pi / 180) * -1),
//               child: _compassSvg,
//             ),
//             Transform.rotate(
//               angle: (qiblahDirection.qiblah * (pi / 180) * -1),
//               alignment: Alignment.center,
//               child: _needleSvg,
//             ),
//             Positioned(
//               bottom: 8,
//               child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
