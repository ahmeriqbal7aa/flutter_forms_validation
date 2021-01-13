import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO Create Global Key
  // create GlobalKey for "Form" of "FormState" type
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // TODO Create Functions
  void validate() {
    if (formKey.currentState.validate()) {
      print('OK');
    } else {
      print('Error');
    }
  }

  // for email validation
  // String emailValidate(val) {
  //   if (val.isEmpty) {
  //     return 'Required';
  //   } else {
  //     return null;
  //   }
  // }

  // for password validation
  // String pwdValidate(val) {
  //   if (val.isEmpty) {
  //     return 'Required';
  //   } else if (val.length < 6) {
  //     return 'Minimum 6 Required';
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Forms and Validation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  // validator: emailValidate,
                  // validator: EmailValidator(errorText: 'Not Valid'),
                  // To add multi validator we pass list as below
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    EmailValidator(errorText: 'Not Valid')
                  ]),
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.orange.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    prefixIcon: Icon(Icons.account_circle),
                    labelText: 'Username or Email',
                    labelStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  // validator: pwdValidate,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    MinLengthValidator(6, errorText: 'Minimum 6 Required')
                  ]),
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.orange.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: validate,
                    color: Colors.orangeAccent,
                    child: Text('Login', style: TextStyle(fontSize: 17.0)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
