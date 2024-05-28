import 'package:explore_era/Views/about_us.dart';
import 'package:explore_era/Views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key, this.isHomePage}) : super(key: key);

  final bool? isHomePage;
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    Color unselectedColor = const Color(0xFFbfbfbf);
    /*if(BaseAppBar.provider.ProviderName.isNotEmpty) {
      unselectedColor = Colors.white;
    }*/
    return BottomNavigationBar(
      elevation: 20.0,
      backgroundColor: const Color(0xFF29395B),
      unselectedItemColor: unselectedColor,
      unselectedLabelStyle: TextStyle(color: unselectedColor),
      selectedItemColor: const Color(0xFFFFFFFF),
      iconSize: 24.0,
      currentIndex: _currentIndex,
      onTap: (value) {
        if (value == 0 && widget.isHomePage == null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
        }
        if (value == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AboutUs(),
            ),
          );
        }
      },
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: SizedBox(
            height: 40,
            child: Icon(
              Icons.home,
              color: Color(0xFFFFFFFF),
            ),
          ),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40,
            child: Icon(
              Icons.info,
              color: unselectedColor,
            ),
          ),
          label: 'About Us',
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
