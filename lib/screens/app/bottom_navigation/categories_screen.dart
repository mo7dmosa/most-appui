import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(5),
      physics: BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // mainAxisExtent: 50,
        childAspectRatio: 132 / 214,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          color:
          index % 2 == 0 ? Colors.pink.shade200 : Colors.orange.shade200,
          child: Text(
            'Counter #$index',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }
}
// body: GridView(
//   padding: const EdgeInsets.all(5),
//   scrollDirection: Axis.vertical,
//   shrinkWrap: false,
//   physics: const BouncingScrollPhysics(),
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     crossAxisSpacing: 10,
//     mainAxisSpacing: 10,
//     // mainAxisExtent: 214,
//     //Cross / Main
//     childAspectRatio: 132 / 214,
//   ),
//   children: [
//     Container(color: Colors.pink.shade200),
//     Container(color: Colors.blue.shade200),
//     Container(color: Colors.orange.shade200),
//     Container(color: Colors.green.shade200),
//     Container(color: Colors.pink.shade200),
//     Container(color: Colors.blue.shade200),
//     Container(color: Colors.orange.shade200),
//     Container(color: Colors.green.shade200),
//     Container(color: Colors.pink.shade200),
//     Container(color: Colors.blue.shade200),
//     Container(color: Colors.orange.shade200),
//     Container(color: Colors.green.shade200),
//   ],
// ),