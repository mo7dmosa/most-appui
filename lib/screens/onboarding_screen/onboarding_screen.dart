import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostui/widgets/on_boarding_content.dart';
import 'package:mostui/widgets/on_boarding_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPageIndex == 2,
                replacement: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInCubic,
                    );
                  },
                  child: Text(
                    'SKIP',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text(
                    'START',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _currentPageIndex = pageIndex;
                  });
                },
                children: const [
                  OnBoardingContent(
                    image: 'image_1',
                    title: 'Welcome!',
                    subTitle:
                        'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch..',
                  ),
                  OnBoardingContent(
                    image: 'image_2',
                    title: 'Add to cart',
                    subTitle:
                        'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch..',
                  ),
                  OnBoardingContent(
                    image: 'image_3',
                    title: 'Enjoy Purchase!',
                    subTitle:
                        'Now were up in the big leagues gettingour turn at bat. The Brady Bunch that\'s the way we  Brady Bunch..',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBoardingIndicator(
                  isSelected: _currentPageIndex == 0,
                  marginEnd: 14,
                ),
                OnBoardingIndicator(
                  isSelected: _currentPageIndex == 1,
                  marginEnd: 14,
                ),
                OnBoardingIndicator(
                  isSelected: _currentPageIndex == 2,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  visible: _currentPageIndex != 0,
                  child: IconButton(
                    onPressed: () {
                      if (_currentPageIndex != 0)
                        _pageController.previousPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutBack);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPageIndex != 2)
                      _pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOutBack);
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                  color: _currentPageIndex == 2 ? Colors.grey : Colors.black,
                ),
              ],
            ),
            SizedBox(height: 10),
            Visibility(
              visible: _currentPageIndex == 2,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6A90F2),
                      minimumSize: Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.5))),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: Text(
                    'START',
                    style: GoogleFonts.nunito(),
                  ),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //       backgroundColor:
            //           _currentPageIndex == 0 ? Colors.blue : Colors.grey.shade200,
            //       borderColor: Colors.orange,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor:
            //           _currentPageIndex == 1 ? Colors.blue : Colors.grey.shade200,
            //       borderColor: Colors.orange,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor:
            //           _currentPageIndex == 2 ? Colors.blue : Colors.grey.shade200,
            //       borderColor: Colors.orange,
            //       size: 10,
            //     ),
            //   ],
            // ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
