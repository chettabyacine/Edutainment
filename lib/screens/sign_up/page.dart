import 'package:edutainment/screens/log_in/page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:edutainment/utils/theme_constants.dart';

class PageSignUp extends StatefulWidget {
  static const String _pageName = kPageNameMenu1;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageSignUpState createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String noun, date, email, password1, password2;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(25.0),
                color: kBlueColor,
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/bird.svg'),
                      Text(
                        'Edutainment',
                        style: kTitleTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                trailing: Icon(
                  Icons.person,
                  color: kBlueColor,
                ),
                title: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    noun = value;
                  },
                  style: kTextFieldStyle,
                  decoration: InputDecoration(
                    hintText: 'Nom et Prénom',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                trailing: Icon(
                  Icons.calendar_today,
                  color: kBlueColor,
                ),
                title: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    date = value;
                  },
                  style: kTextFieldStyle,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Date de naissance'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                trailing: Icon(
                  Icons.email,
                  color: kBlueColor,
                ),
                title: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  style: kTextFieldStyle,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Adresse email'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                trailing: Icon(
                  Icons.lock,
                  color: kBlueColor,
                ),
                title: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password1 = value;
                  },
                  style: kTextFieldStyle,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Mot de passe'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                trailing: Icon(
                  Icons.lock,
                  color: kBlueColor,
                ),
                title: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password2 = value;
                  },
                  style: kTextFieldStyle,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirmer mot de passe'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: ListTile(
                leading: Transform.scale(
                  scale: 0.75,
                  child: Checkbox(
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                    value: _checkbox,
                    checkColor: kBlueColor,
                    activeColor: Colors.white,
                  ),
                ),
                title: Text(
                  'J’accepte la réglemation.',
                  style: kLabelTextStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //TODO: Opération d'inscription (Traitement en BDD)
              },
              child: Container(
                child: Text(
                  'S\'inscrire',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RichText(
              text: TextSpan(
                text: 'Vous avez déja un compte? ',
                style: kLabelTextStyle,
                children: [
                  TextSpan(
                    text: 'S\'identifier',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, PageLogIn.getPageName());
                      },
                    style: TextStyle(
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Mot de passe oublié?',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO: Confirmation de l'identité + Modifier mot de passe
                      },
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
    );
  }
}
