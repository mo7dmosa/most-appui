import 'package:flutter/material.dart';
import 'package:mostui/models/faq.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<Faq> _faqs = <Faq>[
    Faq(question: 'Question #1', answer: 'Answer #1'),
    Faq(question: 'Question #2', answer: 'Answer #2'),
    Faq(question: 'Question #3', answer: 'Answer #3'),
    Faq(question: 'Question #4', answer: 'Answer #4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            onExpansionChanged: (bool expanded) {},
            leading: Icon(Icons.question_answer),
            collapsedBackgroundColor: Color(0xFFD3CEDF),
            collapsedTextColor: Colors.white,
            backgroundColor: Color(0xFFF2D7D9),
            title: Text(_faqs[index].question),
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            expandedAlignment: Alignment.topLeft,
            tilePadding: EdgeInsets.all(10),
            childrenPadding: EdgeInsets.all(10),
            textColor: Colors.red,
            initiallyExpanded: true,
            iconColor: Colors.blue,
            collapsedIconColor: Colors.pink,
            children: [
              Text(
                _faqs[index].answer,
                // textAlign: TextAlign.start,
              ),
            ],
          );
        },
      ),
    );
  }
}

// ListView(
//   children: [
//     ExpansionPanelList(
//       elevation: 4,
//       expandedHeaderPadding:
//           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       animationDuration: Duration(seconds: 1),
//       dividerColor: Colors.pink,
//       expansionCallback: (int index, bool expanded) {
//         print('Index: $index :: Expanded: $expanded');
//         // _faqs.forEach((element) {
//         //   element.expanded = false;
//         // });
//         setState(() => _faqs[index].expanded = !expanded);
//       },
//       children: _faqs.map((Faq faq) {
//         return ExpansionPanel(
//           isExpanded: faq.expanded,
//           canTapOnHeader: true,
//           backgroundColor: Colors.blue.shade100,
//           headerBuilder: (context, isExpanded) {
//             return Row(
//               children: [
//                 Icon(Icons.question_answer),
//                 SizedBox(height: 10),
//                 Text(faq.question),
//               ],
//             );
//           },
//           body: Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             color: Colors.white,
//             child: Text(faq.answer),
//           ),
//         );
//       }).toList(),
//     ),
//   ],
// ),
