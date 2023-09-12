import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        <String, String>{'name': 'Ahmed', 'email': 'ahmed@Email.com'},
        <String, String>{'name': 'Naser', 'email': 'naser@Email.com'}
      ].map((Map<String, String> object) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chat_screen');
          },
          leading: Icon(Icons.person),
          title: Text(object['name'] ?? ''),
          subtitle: Text(object['email'] ?? ''),
          trailing: Icon(Icons.arrow_forward_ios, size: 18),
        );
      }).toList(),
    );
  }
}

// body: ListView.separated(
//   itemBuilder: (context, index) {
//     return ListTile(
//       leading: const Icon(Icons.person),
//       title: Text('Title $index'),
//       subtitle: const Text('Subtitle'),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//     );
//   },
//   separatorBuilder: (context, index) {
//     return const Divider(
//       thickness: 1,
//       indent: 10,
//       endIndent: 10,
//     );
//   },
//   itemCount: 5,
// ),
// body: ListView.builder(
//   itemCount: 10,
//   reverse: false,
//   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//   itemBuilder: (context, index) {
//     return ListTile(
//       leading: const Icon(Icons.person),
//       title: Text('Title $index'),
//       subtitle: const Text('Subtitle'),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//     );
//   },
// ),