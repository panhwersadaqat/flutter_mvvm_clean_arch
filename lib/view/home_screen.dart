import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clearn_arch/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_clearn_arch/utils/utils.dart';
import 'package:flutter_mvvm_clearn_arch/view_model/user_viewmodel.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Added for spacing
            InkWell(
              onTap: () {
                UserViewModel viewModel = UserViewModel();
                viewModel.removeUser();
                Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) => LoginScreen(),
                                    ),
                                        (route) => false,//if you want to disable back feature set to false
                                  );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
