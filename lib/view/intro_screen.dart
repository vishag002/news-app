import 'package:flutter/material.dart';
import 'package:news_app/utilis/color_const.dart';
import 'package:news_app/utilis/text_const.dart';
import 'package:news_app/view/hs_new_ui.dart';
import 'package:news_app/view/user_register.dart';

/* class NewsIntroScreen extends StatelessWidget {
  const NewsIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to News App",
            body: "Get the latest news from around the world.",
            image: Image.asset('assets/images/portrait-rugby-player.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover),
            decoration: PageDecoration(
              pageColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
              imagePadding: EdgeInsets.zero,
            ),
          ),
          PageViewModel(
            title: "Stay Updated",
            body: "Never miss an update on your favorite topics.",
            image: Image.asset('assets/images/pic1.jpg', fit: BoxFit.cover),
            decoration: PageDecoration(
              pageColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
              imagePadding: EdgeInsets.zero,
            ),
          ),
          PageViewModel(
            title: "Personalized News",
            body: "Get news tailored to your interests.",
            image: Image.asset('assets/images/portrait-rugby-player.jpg',
                fit: BoxFit.cover),
            decoration: PageDecoration(
              pageColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
              imagePadding: EdgeInsets.zero,
            ),
          ),
        ],
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(color: Colors.white)),
        next: const Icon(Icons.arrow_forward, color: Colors.white),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          activeColor: Colors.white,
          color: Colors.grey,
        ),
        globalBackgroundColor: Colors.transparent,
        animationDuration: 500,
      ),
    );
  }
} */

//////
///
//intoscreen1

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final w1 = MediaQuery.of(context).size.width;
    final h1 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h1,
        width: w1,
        decoration: BoxDecoration(
          //  color: Colors.amber,
          image: DecorationImage(
              image: AssetImage("assets/images/pic1.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get the latest news",
                style: TextConst.introWhiteFont,
              ),
              Row(
                children: [
                  Text(
                    "from ",
                    style: TextConst.introWhiteFont,
                  ),
                  Text(
                    "reliable sources",
                    style: TextConst.introRedFont,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle,
                      size: 20,
                      color: ColorConst.introButtonColorPressed,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle_outlined,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle_outlined,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "skip",
                      style: TextConst.intro_skip,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroScreen2(),
                      ));
                },
                child: Container(
                  height: h1 / 16,
                  width: w1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextConst.titleText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/////intro screen 2
///
class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final w1 = MediaQuery.of(context).size.width;
    final h1 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h1,
        width: w1,
        decoration: BoxDecoration(
          //  color: Colors.amber,
          image: DecorationImage(
              image: AssetImage("assets/images/pic2.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get actual news from",
                style: TextConst.introWhiteFont,
              ),
              Row(
                children: [
                  /* Text(
                    "from ",
                    style: TextConst.introWhiteFont,
                  ), */
                  Text(
                    "around the world",
                    style: TextConst.introRedFont,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_outlined,
                      size: 20,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle,
                      color: ColorConst.introButtonColorPressed,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle_outlined,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "skip",
                      style: TextConst.intro_skip,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IntroScreen3(),
                      ));
                },
                child: Container(
                  height: h1 / 16,
                  width: w1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextConst.titleText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
///intro screen 3

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final w1 = MediaQuery.of(context).size.width;
    final h1 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h1,
        width: w1,
        decoration: BoxDecoration(
          //  color: Colors.amber,
          image: DecorationImage(
              image: AssetImage("assets/images/pic3.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sports,politics,",
                style: TextConst.introWhiteFont,
              ),
              Row(
                children: [
                  Text(
                    "health,",
                    style: TextConst.introWhiteFont,
                  ),
                  Text(
                    "& anything",
                    style: TextConst.introRedFont,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_outlined,
                      size: 20,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle_outlined,
                      color: ColorConst.introButtonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      size: 20,
                      Icons.circle,
                      color: ColorConst.introButtonColorPressed,
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "",
                      style: TextConst.intro_skip,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                child: Container(
                  height: h1 / 16,
                  width: w1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "continue",
                      style: TextConst.titleText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
