import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import '../sign_up/app_bar.dart';
import '../log_in/page.dart';
import '../sign_up/input_widget.dart';


class PageLogIn extends StatefulWidget {

  static const String _pageName = kPageNameLogIn;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageLogInState createState() => _PageLogInState();
}

class _PageLogInState extends State<PageLogIn> {
  TextStyle style = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Color(0xFF3347FF),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Adresse email",
        hintStyle: TextStyle(color: Color(0xFF3347FF)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Color(0xFF3347FF), width: 2),
        ),
      ),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(
          Icons.lock,
          color: Color(0xFF3347FF),
        ),
        hintText: "Mot de passe",
        hintStyle: TextStyle(color: Color(0xFF3347FF)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Color(0xFF3347FF), width: 2),
        ),
      ),
    );

    final loginButon = Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff3347FF),
      child: MaterialButton(
        minWidth: 100.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Allons-y!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Acme',
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(),
        body: Column(
          children: [
            AppBarWidget(height: 250.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Padding(child: emailField,padding: EdgeInsets.symmetric(horizontal: 40.0),),
                  SizedBox(height: 25.0),
                  Padding(child: passwordField,padding: EdgeInsets.symmetric(horizontal: 40.0),),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(child: loginButon,padding: EdgeInsets.symmetric(horizontal:110.0),),
                  SizedBox(
                    height: 127.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Vous avez déja un compte? ',
                      style: kLabelTextStyle,
                      children: [
                        TextSpan(
                          text: 'S\'identifier',
                          //TODO : ADD TapGestureRecognizer
                          /*recognizer: TapGestureRecognizer()
                                 ..onTap = () {
                                   Navigator.pushNamed(
                                       context, PageLogIn.getPageName());
                                 },*/
                          style: TextStyle(
                            color: kBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mot de passe oublié?',
                          //TODO : ADD TapGestureRecognizer
                          /*recognizer: TapGestureRecognizer()
                                 ..onTap = () {
                                   //TODO: Confirmation de l'identité + Modifier mot de passe
                                 },*/
                          style: kLabelTextStyle.copyWith(
                            color: kBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

