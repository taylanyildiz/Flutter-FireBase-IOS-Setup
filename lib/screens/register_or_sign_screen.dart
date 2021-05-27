import 'package:fire_base/services/auth_firebase.dart';
import 'package:fire_base/widgets/input_widgets.dart';
import 'package:flutter/material.dart';

class RegisterOrSignScreen extends StatefulWidget {
  @override
  _RegisterOrSignScreenState createState() => _RegisterOrSignScreenState();
}

class _RegisterOrSignScreenState extends State<RegisterOrSignScreen> {
  @override
  void initState() {
    super.initState();
    _initialInput();
  }

  void _initialInput() {
    _formKey = GlobalKey();
    for (var i = 0; i < 2; i++) {
      _textController.add(TextEditingController());
    }
  }

  late GlobalKey<FormState> _formKey;
  final _textController = <TextEditingController>[];
  final _hints = <String>['e-mail adress', 'password'];

  String? email;
  String? password;

  AuthFirebase _authFirebase = AuthFirebase();

  void _register() async {
    final check = _formKey.currentState!.validate();
    if (check) {
      email = _textController[0].text;
      password = _textController[1].text;

      await _authFirebase.registerUserWithEmailandPassword(email, password);
    }
  }

  void _login() async {
    final check = _formKey.currentState!.validate();
    if (check) {
      email = _textController[0].text;
      password = _textController[1].text;
      await _authFirebase.singUserWithEmailandPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register or Sign'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20),
            child: Text(
              'FireBase Sing or Register,Please entry e-mail and password,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InputWidget(
            formKey: _formKey,
            textController: _textController,
            hints: _hints,
          ),
          SizedBox(height: 10.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: MaterialButton(
              onPressed: () => _login(),
              child: Text('Login Firebase'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: MaterialButton(
              onPressed: () => _register(),
              child: Text('Register Firebase'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
