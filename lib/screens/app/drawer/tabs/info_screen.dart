import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostui/screens/app/drawer/tabs/first_tab_screen.dart';
import 'package:mostui/screens/app/drawer/tabs/second_tab_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        bottom: TabBar(
          isScrollable: false,
          controller: _tabController,
          //*****************************
          indicatorColor: Colors.orange,
          indicatorWeight: 8,
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(0),
          // indicator: BoxDecoration(
          //   color: Colors.orange,
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(10),
          //     topRight: Radius.circular(10),
          //   ),
          // ),
          //*****************************
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          labelStyle: GoogleFonts.nunito(
              letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle:
              GoogleFonts.cairo(letterSpacing: 0, fontSize: 14),
          // labelPadding: EdgeInsets.all(10),
          // padding: EdgeInsets.all(10),
          //*****************************
          onTap: (int tabIndex) {
            print('TabIndex: $tabIndex');
          },

          //*****************************
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FirstTabScreen(),
          SecondTabScreen()
        ],
      ),
    );
  }
}
