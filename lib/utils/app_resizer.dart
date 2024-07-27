import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResizer {
  static double screenAwareSize(int size, BuildContext context) {
    double baseHeight = 640.0;
    return size * MediaQuery.sizeOf(context).height / baseHeight;
  }

  static final double h1 = 52.sp;
  static final double h2 = 32.sp;
  static final double h3 = 24.sp;
  static final double h4 = 34.sp;
  static final double h5 = 24.sp;
  static final double h6 = 20.sp;
  static final double h7 = 18.sp;
  static final double body1 = 16.sp;
  static final double body2 = 14.sp;
  static final double caption = 12.sp;
  static final double smallCaption = 10.sp;

  static const double negative = -1.1;
  static const double none = 0;
  static final double space1 = 1.w;
  static final double space2 = 2.w;
  static final double space3 = 3.w;
  static final double space4 = 4.w;
  static final double space5 = 5.w;
  static final double space6 = 6.w;
  static final double space8 = 8.w;
  static final double space10 = 10.w;
  static final double space12 = 12.w;
  static final double space14 = 14.w;
  static final double space15 = 15.w;
  static final double space16 = 16.w;
  static final double space18 = 18.w;
  static final double space20 = 20.w;
  static final double space22 = 22.w;
  static final double space24 = 24.w;
  static final double space25 = 25.w;
  static final double space30 = 30.w;
  static final double space32 = 32.w;
  static final double space36 = 36.w;
  static final double space40 = 40.w;
  static final double space42 = 42.w;
  static final double space44 = 44.w;
  static final double space45 = 45.w;
  static final double space46 = 46.w;
  static final double space48 = 48.w;
  static final double space50 = 50.w;
  static final double space54 = 54.w;
  static final double space56 = 56.w;
  static final double space62 = 62.w;
  static final double space64 = 64.w;
  static final double space60 = 60.w;
  static final double space70 = 70.w;
  static final double space72 = 72.w;
  static final double space74 = 74.w;
  static final double space76 = 76.w;
  static final double space80 = 80.w;
  static final double space82 = 82.w;
  static final double space86 = 86.w;
  static final double space90 = 90.w;
  static final double space100 = 100.w;
  static final double space110 = 110.w;
  static final double space120 = 120.w;
  static final double space130 = 130.w;
  static final double space140 = 140.w;
  static final double space150 = 150.w;
  static final double space160 = 160.w;
  static final double space180 = 180.w;
  static final double space200 = 200.w;
  static final double space210 = 210.w;
  static final double space220 = 220.w;
  static final double space240 = 240.w;
  static final double space300 = 300.w;
  static final double space350 = 350.w;
}
