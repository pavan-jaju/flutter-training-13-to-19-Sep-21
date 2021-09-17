import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/page/login/_state/login_page_x.dart';
import 'package:flutter_taining_app_1/page/product_list_page_v2/product_list_page_v2.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageX get _loginPageX => Get.find();

  final _formKey = GlobalKey<FormState>();

  late FocusNode _passwordFieldFocusNode;

  late FocusNode _submitButtonFocusNode;

  String? _username;
  String? _password;

  @override
  void initState() {
    super.initState();
    _passwordFieldFocusNode = FocusNode();
    _submitButtonFocusNode = FocusNode();

    Get.put(LoginPageX());

    ever(
        _loginPageX.error,
        (_) => print(
            "===============> _loginPageX.error ${_loginPageX.error} has been changed"));
  }

  _submitHandler() {
    var formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();

      _loginPageX.verifyUser(username: _username!, password: _password!);

      // Get.to(ProductListPageV2());

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProductListPageV2(),
      //     settings: RouteSettings(name: "/home"),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 32),
                  Text(
                    "Login to proceed",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      //labelText: "Username",
                      hintText: "Username",
                      helperText: "no email addresses please...",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefix: Icon(Icons.verified_user),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                    onSaved: (newValue) => _username = newValue,
                    onFieldSubmitted: (value) {
                      _passwordFieldFocusNode.requestFocus();
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    focusNode: _passwordFieldFocusNode,
                    // obscureText: true,
                    // obscuringCharacter: "#",
                    decoration: InputDecoration(
                        // labelText: "Password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: "Password",
                        helperText:
                            "password should be at least 8 charactres long...",
                        helperStyle: TextStyle(color: Colors.redAccent),
                        prefix: Icon(Icons.lock)),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                    onSaved: (newValue) => _password = newValue,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onEditingComplete: () {},
                    onFieldSubmitted: (value) {
                      _submitHandler();
                      // _submitButtonFocusNode.requestFocus();
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    focusNode: _submitButtonFocusNode,
                    onPressed: _submitHandler,
                    child: Text("LOGIN"),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
