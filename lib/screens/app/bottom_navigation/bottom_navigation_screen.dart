import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostui/models/bn_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/categories_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/home_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/settings_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/users_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(widget: HomeScreen(), title: 'Home'),
    const BnScreen(widget: UsersScreen(), title: 'Users'),
    const BnScreen(widget: CategoriesScreen(), title: 'Categories'),
    const BnScreen(widget: SettingsScreen(), title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bnScreens[_currentIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(),
              accountName: const Text('Flutter'),
              accountEmail: const Text('flutter@email.com'),
              // currentAccountPictureSize: Size(80,80),
              // otherAccountsPicturesSize: Size(30,30),
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Colors.blue.shade100,
                    Colors.blue.shade600,
                  ]
                )
              ),
              otherAccountsPictures: [
                const CircleAvatar(),
                const CircleAvatar(),
                const CircleAvatar(),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/info_screen');
                });
              },
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              subtitle: const Text('Know more'),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/faqs_screen');
                });
              },
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQs'),
              subtitle: const Text('Frequently Questions'),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/test_tab_screen');
                });
              },
              leading: const Icon(Icons.question_answer),
              title: const Text('Test Tab'),
              subtitle: const Text('Test'),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
              indent: 30,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Return to login'),
            ),
          ],
        ),
      ),
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int currentIndex) {
          setState(() => _currentIndex = currentIndex);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        //*****************************
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //*****************************
        // fixedColor: Color(0xFF72576E),
        selectedItemColor: const Color(0xFF7D9D9C),
        selectedIconTheme: const IconThemeData(
          color: const Color(0xFF72576E),
        ),
        //*****************************
        unselectedItemColor: const Color(0xFFD3CEDF),
        unselectedIconTheme: const IconThemeData(
          color: const Color(0xFFD3CEDF),
        ),
        //*****************************
        // iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        elevation: 10,
        //*****************************
        selectedLabelStyle: GoogleFonts.nunito(),
        unselectedLabelStyle: GoogleFonts.nunito(),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
