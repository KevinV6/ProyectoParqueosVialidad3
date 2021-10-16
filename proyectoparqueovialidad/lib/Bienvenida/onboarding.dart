import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';
import 'package:proyectoparqueovialidad/Notificaciones/Epic4Task1.dart';
import 'package:proyectoparqueovialidad/main.dart';

import '../preferences.dart';


void main() {
  runApp(MyApp());
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key,}) : super(key: key);
  static String id = "onboarding_page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        'assets/image/Menu/logo.png',
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
      imageAssetPath: Image.asset('assets/image/Onboarding/uno.png'),
      title: 'Bienvenido a Cardrop',
      desc: 'Conoce los puntos autorizados de parqueo en la ciudad.',
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/image/Onboarding/dos.png'),
      title: '',
      desc: 'Recibe notificaciones de cierre de avenidas.',
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/image/Onboarding/tres.png'),
      title: '',
      desc: 'Regístrate en nuestra aplicación para disfrutar de Cardrop.',
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
      label: const Text('Comenzar'),

      /// This function works when you will complete `OnBoarding`
      ///
      function: () {
        // print('Navigation');
        final preferences = Preferences();
        preferences.initialPage = MyHomePage.id;
        Navigator.pushNamed(context, MyHomePage.id);
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
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