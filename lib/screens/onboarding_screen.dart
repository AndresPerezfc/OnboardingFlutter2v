import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreenStates extends StatefulWidget {
  @override
  _OnboardingScreenStatesState createState() => _OnboardingScreenStatesState();
}

class _OnboardingScreenStatesState extends State<OnboardingScreenStates> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff5abd8c) : Color(0xffD6EEE2),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => print('Omitir'),
                  child: Text('Omitir',
                      style: TextStyle(
                          color: Color(0xff5abd8c),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)),
                ),
              ),
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Encuentra parqueaderos cerca de ti',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28.0, color: Color(0xff5abd8c)),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: Text(
                              'Sugerencias cerca a tu ubicación',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff5abd8c),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              'assets/slide-1.svg',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Compara precios',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28.0, color: Color(0xff5abd8c)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: Text(
                              'Compara precios y elige el parqueadero mas adecuado',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff5abd8c),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              'assets/slide-2.svg',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Realiza reservas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28.0, color: Color(0xff5abd8c)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: Text(
                              'Ahorra tiempo programando tus reservas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff5abd8c),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              'assets/slide-3.svg',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Icon(Icons.arrow_forward,
                                  color: Color(0xff5abd8c), size: 30.0),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text('')
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Color(0xff5abd8c),
              child: GestureDetector(
                onTap: () => print('iniciar'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Iniciar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
