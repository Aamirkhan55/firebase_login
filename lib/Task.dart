import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
          body:
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 50),
                 child: Container(
                   height: 300,
                   decoration: const BoxDecoration(
                     color: Colors.white
                   ),
                   child: Column(
                     children: [
                       const SizedBox(height: 20),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           children: [
                            IconButton(onPressed: () {}, 
                            icon: const Icon(Icons.radio_button_checked)
                            ),
                            const SizedBox(width: 5),
                           const Text(
                             'Mood Reminder',
                             style: TextStyle(
                               color: Colors.blue,
                               fontWeight: FontWeight.bold,
                               fontSize: 19,
                             ),
                           ),
                             const SizedBox(width: 125),
                             const Text(
                               '3',
                               style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.blue,
                               ),
                             ),
                             IconButton(
                               onPressed: () {},
                               icon: const Icon(
                                 Icons.add,
                                 size: 30,
                                 color: Colors.blue,
                               ),
                             )
                           ],
                         ),
                       ),
                       const Divider(
                         color: Colors.grey,
                         thickness: 2,
                       ),
                       const ListTile(
                         leading: Icon(Icons.delete_forever_rounded),
                         title: Text('Reminder #1'),
                         trailing: Text('11:00'),
                       ),
                       const SizedBox(height: 10),
                       const ListTile(
                         leading: Icon(Icons.delete_forever_rounded),
                         title: Text('Reminder #2'),
                         trailing: Text('15:00'),
                       ),
                       const SizedBox(height: 10),
                       const ListTile(
                         leading: Icon(Icons.delete_forever_rounded),
                         title: Text('Reminder #3'),
                         trailing: Text('19:00'),
                       ),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 270),
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       height: 65,
                       width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.pink[50],
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: const Center(
                         child: Text(
                           'Done',
                           style: TextStyle(
                             color: Colors.grey,
                             fontSize: 16,
                             fontWeight: FontWeight.normal,
                           ),
                           ),
                       ),
                     ),
                   ),
                 ],
               )
             ],
           )),
    );
  }
}
