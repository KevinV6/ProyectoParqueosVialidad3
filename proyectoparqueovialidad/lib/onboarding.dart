import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        '../asset/image/Logo.png',
        scale: 1,
      ),
      title: 'CARDROP',
      desc: '',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: Colors.indigo,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('../asset/image/OnboardingImg/1.png'),
      title: 'Bienvenido a Cardrop',
      desc: 'Una aplicación pensada para realizar reservas de parqueos, \nen muy pocos pasos todo desde el alcance de tu celular.',
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('../asset/image/OnboardingImg/2.png'),
      title: '',
      desc: 'Realiza tu reserva online para un punto de parqueo en la ciudad, \npara el día y la hora de tu preferencia.',
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('../asset/image/OnboardingImg/3.png'),
      title: '',
      desc: 'Recarga crédito para próximos reservas y evita \nremolques pagando horas extras.\nTodo desde Cardrop...',
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  ];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text('Get Started'),

      /// This function works when you will complete `OnBoarding`
      function: () {
        print('Navigation');
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.lightGreenAccent,
      startGradientColor: Colors.white,
      endGradientColor: Colors.white,
      skipStyle: TextStyle(color: Colors.indigo),
      pageIndicatorColorList: [
        Colors.blue,
        Colors.amber,
        Colors.indigo,
        Colors.amber,
        Colors.indigo
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Image? imageAssetPath;
  final String title;
  final TextStyle? titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle? descStyle;
  final double miniDescFontSize;
}