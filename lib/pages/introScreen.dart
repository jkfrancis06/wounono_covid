import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wounono_covid/pages/startupScreen.dart';
import 'package:wounono_covid/utils/constants.dart';


class IntroScreen extends StatefulWidget {

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator
        .of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => StartupScreen()));

  }


  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/images/introduction/$assetName', width: width, height: 200,);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromRGBO(
          245, 247, 249, 1.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color.fromRGBO(
          245, 247, 249, 1.0),
      pages: [
        PageViewModel(
          title: "Lavez-vous les mains",
          body:
          "Lavez-vous fréquemment les mains. Utilisez du savon et de l'eau, ou une solution hydroalcoolique",
          image: _buildImage('wash_hands.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Respectez la distanciation sociale",
          body:
          "Tenez-vous à distance de toute personne qui tousse ou éternue",
          image: _buildImage('social_distancing.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Portez les masques",
          body:
          "Portez un masque lorsque la distanciation physique n'est pas possible",
          image: _buildImage('wear_mask.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Faites-vous vacciner",
          body:
          "Vaccinez-vous afin de vous protéger et de proteger vos proches",
          image: _buildImage('startup.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Passer'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Terminer', style: TextStyle(fontWeight: FontWeight.w600)),
      skipColor: Constants.primaryColor,
      doneColor: Constants.primaryColor,
      nextColor: Constants.primaryColor,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: const Color(0xff3d8e33),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
