
import 'package:flutter/material.dart';
import '../HomepageRedirect/AboutUs.dart';
import '../MyHomePage.dart';


class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key, this.isHomePage }) : super(key: key);

  final bool? isHomePage;
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;


  void onTappedBar(int index){
    setState((){
      _currentIndex = index;
    });
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    Color unselectedColor = Color(0xFFbfbfbf);
    /*if(BaseAppBar.provider.ProviderName.isNotEmpty) {
      unselectedColor = Colors.white;
    }*/
    return  BottomNavigationBar(
      elevation: 20.0,
      backgroundColor: const Color(0xFF29395B),

      unselectedItemColor: unselectedColor,
      unselectedLabelStyle: TextStyle(color: unselectedColor),
      selectedItemColor: Color(0xFFFFFFFF),
      iconSize: 24.0,

      currentIndex: _currentIndex,
      onTap: (value) {
        if (value == 0 && widget.isHomePage == null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: "AdvenTour")));
        }
        if (value == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUs()));
        }
      },

      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: SizedBox(
            height: 40,
            child: Icon(Icons.home,
              color: Color(0xFFFFFFFF),
            ),
          ),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40,
            child: Icon(Icons.info,
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


