import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/on_boarding/model/on_boarding_data.dart';

class PageViewItemWidget extends StatelessWidget {
  const PageViewItemWidget({super.key, required this.data});
  final OnBoardingData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(data.image)),

        Text(
          data.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.gold,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        if (data.description != null)
          Text(
            data.description!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.gold,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
