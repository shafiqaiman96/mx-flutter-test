import 'package:flutter/material.dart';

import '../global_widgets/global_widgets.dart';
import '../utils/utils.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: AppColors.grey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppResizer.space16,
                AppResizer.space10,
                AppResizer.space16,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int j = 0; j < 2; j++) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 8; i++) ...[
                          RectangleShimmer(
                            width: AppResizer.space160,
                            height: AppResizer.space120,
                          ),
                          SizedBox(height: AppResizer.space4),
                          RectangleShimmer(
                            width: AppResizer.space130,
                            height: AppResizer.space30,
                          ),
                          SizedBox(height: AppResizer.space4),
                          RectangleShimmer(
                            width: AppResizer.space140,
                            height: AppResizer.space20,
                          ),
                          SizedBox(height: AppResizer.space10),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
