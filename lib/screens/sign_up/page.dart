import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import '../sign_up/app_bar.dart';
import '../log_in/page.dart';
import '../sign_up/input_widget.dart';

class PageSignUp extends StatefulWidget {
  static const String _pageName = kPageNameMenu1;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageSignUpState createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String name, birthDay, email, password1, password2;
  UserLogIn user;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(),
        body: Column(
          children: [
            AppBarWidget(height: 170.0),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  InputWidget(
                    data: name,
                    icon: Icons.person,
                    label: 'Nom Prénom',
                  ),
                  InputWidget(
                    data: birthDay,
                    icon: Icons.calendar_today,
                    label: 'Date de naissance',
                  ),
                  InputWidget(
                    data: email,
                    icon: Icons.email,
                    label: 'Adresse email',
                  ),
                  InputWidget(
                    data: password1,
                    icon: Icons.lock,
                    label: 'Mot de passe',
                  ),
                  InputWidget(
                    data: password2,
                    icon: Icons.lock,
                    label: 'Confirmer mot de passe',
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
                  TextButton(
                    onPressed: () {
                      //TODO: Opération d'inscription (Traitement en BDD)
                      user = UserLogIn(
                        name: name,
                        birthDay: birthDay,
                        email: email,
                        password1: password1,
                        password2: password2,
                      );
                    },
                    child: Container(
                      child: Text(
                        'S\'inscrire',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Acme',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(1.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Vous avez déja un compte? ',
                      style: kLabelTextStyle,
                      children: [
                        TextSpan(
                          text: 'S\'identifier',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, PageLogIn.getPageName());
                            },
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
                  SizedBox(
                    height: 10.0,
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

class UserLogIn {
  String name, birthDay, email, password1, password2;
  UserLogIn(
      {this.name, this.birthDay, this.email, this.password1, this.password2});
}
