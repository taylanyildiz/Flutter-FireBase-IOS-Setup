import 'package:fire_base/services/auth_firebase.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    Key? key,
    this.email,
  }) : super(key: key);
  final String? email;
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AuthFirebase _authFirebase = AuthFirebase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.email}'),
        actions: [
          IconButton(
            onPressed: () async => await _authFirebase.singOut(),
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
