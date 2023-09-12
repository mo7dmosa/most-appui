import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Categories',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: GridView.builder(
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(color: Colors.pink.shade200);
            },
          ),
        ),
        // SizedBox(
        //   height: 120,
        //   child: ListView.builder(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     itemCount: 10,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         color: Colors.pink.shade200,
        //         margin: EdgeInsetsDirectional.only(end: 10),
        //         width: 100,
        //         height: 100,
        //       );
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Latest Products',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.title),
                title: Text('Title'),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Latest Products',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade200,
            );
          },
        )
      ],
    );
  }
}
