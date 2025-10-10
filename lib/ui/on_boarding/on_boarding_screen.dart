import 'package:flutter/material.dart';
import 'package:islami_c16/core/cache/cach_keys.dart';
import 'package:islami_c16/core/cache/shared_pref_service.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/on_boarding/model/on_boarding_data.dart';
import 'package:islami_c16/ui/on_boarding/widgets/dot_indecator.dart';
import 'package:islami_c16/ui/on_boarding/widgets/page_view_item_widget.dart';
import 'package:islami_c16/ui/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.logo, height: size.height * .1),
            SizedBox(height: 20),

            Expanded(
              child: PageView.builder(
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                controller: pageController,
                itemCount: OnBoardingData.onBoardingList.length,
                itemBuilder: (context, index) {
                  var data = OnBoardingData.onBoardingList[index];
                  return PageViewItemWidget(data: data);
                },
              ),
            ),
            Stack(
              /// text code review tool
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: currentIndex != 0,
                      child: TextButton(
                        onPressed: _backTap,
                        child: Text('Back'),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: _nextTap,
                      child: Text(
                        OnBoardingData.onBoardingList.length - 1 == currentIndex
                            ? 'Finish'
                            : 'Next',
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(OnBoardingData.onBoardingList.length, (
                      index,
                    ) {
                      return DotIndecator(isActive: currentIndex == index);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _backTap() {
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextTap() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    if (OnBoardingData.onBoardingList.length - 1 == currentIndex) {
      SharedPrefService.saveBooleen(CachKeys.isFirstTime, false);
      Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen.route);
    }
  }
}
// flag 