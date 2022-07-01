import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboard_design/build_onboard_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final _controller = PageController();
  bool _isLastPage = false;
  int indexV = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) => {
            setState(() {
              _isLastPage = index == 2;
              indexV = index;
            })
          },
          controller: _controller,
          children: [
            buildOnBoardPage(
                image: "assets/1.png",
                title: "Get Inspired",
                subtitle:
                    "Don't know what to eat? Take a picture, we'll suggest things to cook with your ingredients.",
                clr: const Color(0xFFffbe9a)),
            buildOnBoardPage(
                image: "assets/2.png",
                title: "Easy & Healthy",
                subtitle:
                    "Find thousands of easy and healthy recipes so you save time and eat better.",
                clr: const Color(0xFFfeb05b)),
            buildOnBoardPage(
                image: "assets/3.png",
                title: "Save your favorites",
                subtitle:
                    "Save your favorite recipes and get reminders to buy the ingredients to cook them.",
                clr: const Color(0xFF01b192)),
          ],
        ),
      ),
      bottomSheet: _isLastPage
          ? Container(
              margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              color: const Color(0xFF01b192),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(500, 75),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              height: 80,
              color: indexV == 0
                  ? const Color(0xFFffbe9a)
                  : indexV == 1
                      ? const Color(0xFFfeb05b)
                      : const Color(0xFF01b192),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _controller.jumpToPage(2),
                    child: Text(
                      "SKIP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          spacing: 10,
                          dotColor: Colors.white,
                          activeDotColor: Colors.white60),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      "NEXT",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
