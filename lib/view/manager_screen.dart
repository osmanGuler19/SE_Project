import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotur/view/login.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> useCases = [
      'Edit Profile',
      'Set Store Location',
      'Edit Store Location',
      'Define New Product',
      'Product Information',
      'Check Stock',
      'Define Coupon',
      'Edit Coupon',
      'FullFill Order',
      'Get Report',
      'Log Out'
    ];

    List<String> messages = [
      'Edited Profile',
      'Setted Store Location',
      'Edited Store Location',
      'Defined New Product',
      'Product Information',
      'Checked Stock',
      'Defined Coupon',
      'Edited Coupon',
      'FullFilled Order',
      'Getted Report',
      'Logged Out'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Center(child: Text('Manager Screen')),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50.0,
              child: ClipRRect(
                child: Image.asset('managerpic.jpg'),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: useCases.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[400],
                      elevation: 4,
                      child: ListTile(
                        tileColor: Colors.orange[900],
                        leading: Icon(Icons.check_circle),
                        title: Text(useCases[index]),
                        onTap: () {
                          if (index == useCases.length - 1) {
                            Navigator.of(context).pop(
                                MaterialPageRoute(builder: (_) => Login()));
                          }
                          Fluttertoast.showToast(msg: messages[index]);
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
