import 'package:edutainment/screens/home/page.dart';
import 'package:edutainment/screens/sign_up/page.dart';
import 'package:edutainment/widgets/WidgetActionButton.dart';
import 'package:edutainment/widgets/WidgetActionButton2.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import '../../widgets/WidgetAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'local_widgets/EmailInput.dart';
import '../../widgets/WidgetFooterPasswordForgot.dart';
import '../../widgets/WidgetFooterText.dart';
import 'local_widgets/PasswordInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edutainment/widgets/WidgetSnackBarText.dart';
import 'package:email_validator/email_validator.dart';

class PageLogIn extends StatefulWidget {
  static const String _pageName = kPageNameLogIn;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageLogInState createState() => _PageLogInState();
}

class _PageLogInState extends State<PageLogIn> {
  TextStyle style = kSignUpLabelTextStyle;
  String email, password;
  final globalKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential _userCredential;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            WidgetAppBar(
              height: 250.0,
              logo: SvgPicture.asset('assets/bird.svg'),
              title: kProjectName,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Padding(
                    child: EmailInput(
                      onChanged: getEmail,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    child: PasswordInput(
                      onChanged: getPassword,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    child: WidgetActionButton2(
                      text: 'S\'identifier',
                      isFilled: true,
                      onPressed: signInUSer,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  FooterText(
                      text1: 'Vous n\'avez pas un compte? ',
                      text2: 'S\'inscrire',
                      destination: PageSignUp.getPageName()),
                  FooterPasswordForgot(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void getEmail(value){
    email = value;
  }
  void getPassword(value){
    password = value;
  }
  void signInUSer() async {
    if ((email != null) && (!(email?.isEmpty ?? true)) && (password != null) &&
        (!(password?.isEmpty ?? true))) {
      if (!EmailValidator.validate(email)) {
        //"invalid email"
        globalKey.currentState.showSnackBar(
            SnackBar(
                content: WidgetSnackBarText("L'email entré n'est pas valide!"),
                backgroundColor: kVioletColor)
        );
      } else {
        //Sign in
        try {
          _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password
          );
          Navigator.pushNamed(context, PageHome.getPageName());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            globalKey.currentState.showSnackBar(
                SnackBar(
                    content: WidgetSnackBarText("Aucun utilisateur avec ces coordonnées!"),
                    backgroundColor: kVioletColor)
            );
          } else if (e.code == 'wrong-password') {
            globalKey.currentState.showSnackBar(
                SnackBar(
                    content: WidgetSnackBarText(" Mot de passe incorrect!"),
                    backgroundColor: kVioletColor)
            );
          }
        }
      }
    } else {
      //Des champs qui manquent
      globalKey.currentState.showSnackBar(
          SnackBar(
              content: WidgetSnackBarText("Vous devez remplir les champs!"),
              backgroundColor: kVioletColor)
      );
    }
  }
}