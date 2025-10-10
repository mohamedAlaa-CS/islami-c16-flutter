import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';

class SebhaContent extends StatefulWidget {
  const SebhaContent({super.key});

  @override
  State<SebhaContent> createState() => _SebhaContentState();
}

class _SebhaContentState extends State<SebhaContent> {
  double angle = 5;
  int counter = 0;
  List<String> azkarList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(AppImages.sebhaHead, height: size.height * .093),
              Padding(
                padding: EdgeInsets.only(top: size.height * .08),
                child: GestureDetector(
                  onTap: _sebhaOnTap,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(AppImages.sebhaBody),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            azkarList[currentIndex],
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '$counter',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _sebhaOnTap() {
    angle += 2;
    counter++;
    if (counter % 33 == 0) {
      currentIndex = (currentIndex + 1) % azkarList.length;
      counter = 0;
    }
    setState(() {});
  }
}
