
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_apps/pages/tab1_page.dart';
import 'package:flutter_news_apps/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) => navegacionModel.paginaActual = index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'General'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety),
          label: 'Health'
        ),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      //physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
      
      ],
    );
  }
}

// This class is used to manage the current page and the PageController for the PageView.
// It uses ChangeNotifier to notify listeners when the current page changes.
class _NavegacionModel with ChangeNotifier {

  int _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  PageController get pageController => this._pageController;

// This method sets the current page and animates the PageView to that page.
// It also notifies listeners about the change.
  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._pageController.animateToPage(
      valor, 
      duration: Duration(milliseconds: 200), 
      curve: Curves.easeInOut
    );
    notifyListeners();
  }

}