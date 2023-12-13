import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Map<String, dynamic> userData = {}; // Use Map<String, dynamic> for better type safety
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child:Image(
                    image: AssetImage('assets/profile-user.png'),
                  )
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter email address'),
                            EmailValidator(errorText: 'Please enter a valid email'),
                          ]),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              //color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Please enter Password'),
                            MinLengthValidator(8, errorText: 'Password must be at least 8 characters'),
                            PatternValidator(
                              r'(?=.*?[#!@$%^&*-])',
                              errorText: 'Password must contain at least one special character',
                            ),
                          ]),
                          obscureText: true, // Use obscureText for password fields
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.green,
                            ),
                            errorStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(180, 0, 0, 0),
                        child: Text('Forget Password!'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          child: ElevatedButton(
                            // Use ElevatedButton instead of RaisedButton
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('form submitted');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              //primary: Colors.blue,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.black, fontSize: 26),
                            ),
                            // backgroundColor: Colors.lightBlue,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(
                            'Already have an Account , SIGN IN',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  // child: Image.asset(
                                  //   'assets/social.jpg',
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  // child: Image.asset(
                                  //   'assets/vishal.png',
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  //child: Image.asset(
                                   // 'assets/google.png',
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'SIGN UP!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
