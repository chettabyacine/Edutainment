import 'package:edutainment/widgets/WidgetActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import '../../widgets/WidgetAppBar.dart';
import '../log_in/page.dart';
import '../home/page.dart';
import 'local_widgets/WidgetInputSignUp.dart';
import 'package:edutainment/widgets/WidgetFooterPasswordForgot.dart';
import 'package:edutainment/widgets/WidgetFooterText.dart';
import 'local_widgets/ClassUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';
import 'package:commons/commons.dart';
import 'package:edutainment/widgets/WidgetActionButton2.dart';
import 'package:edutainment/widgets/WidgetSnackBarText.dart';

class PageSignUp extends StatefulWidget {
  static const String _pageName = kPageNameSignUp;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageSignUpState createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String name, email, password1, password2;
  String birthDay = 'Date de naissance';
  bool _checkbox = false, emailValid;
  SignUpUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  UserCredential _userCredential;
  final globalKey = GlobalKey<ScaffoldState>();
  var inputEmail = InputWidget(
    icon: Icons.email,
    label: 'Adresse email',
  );
  var inputName = InputWidget(
    icon: Icons.person,
    label: 'Nom',
  );
  var inputPassword1 = InputWidget(
    icon: Icons.lock,
    label: 'Mot de passe',
  );
  var inputPassword2 = InputWidget(
    icon: Icons.lock,
    label: 'Confirmer mot de passe',
  );
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
                height: 170.0,
                logo: SvgPicture.asset('assets/bird.svg'),
                title: kProjectName,
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    inputName,
                    DateInput(context),
                    inputEmail,
                    inputPassword1,
                    inputPassword2,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
                      child: WidgetCheckBox(),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: WidgetActionButton2(
                        text: 'S\'inscrire',
                        isFilled: true,
                        onPressed: signUpUser,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    FooterText(
                        text1: 'Vous avez déja un compte? ',
                        text2: 'S\'identifier',
                        destination: PageLogIn.getPageName()),
                    FooterPasswordForgot(),
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

  void signUpUser() async {
    //Opération d'inscription (Traitement en BDD)
    name = inputName.data; email = inputEmail.data; password1 = inputPassword1.data; password2 = inputPassword2.data;
    if ((name != null) && (!(name?.isEmpty ?? true)) && (email != null) && (!(email?.isEmpty ?? true)) && (password1 != null) && (!(password1?.isEmpty ?? true)) && (password2 != null) && (!(password2?.isEmpty) ?? true) && (birthDay != null) && (!(birthDay?.isEmpty) ?? true)) {
      if(!EmailValidator.validate(email)){
        //"invalid email"
        globalKey.currentState.showSnackBar(
            SnackBar(content: WidgetSnackBarText("L'email entré n'est pas valide!"), backgroundColor: kVioletColor)
        );
      } else {
        if (password1 != password2) {
          //Les deux mots de passe ne sont pas identiques
          globalKey.currentState.showSnackBar(
              SnackBar(content: WidgetSnackBarText("Les deux mots de passe doivent etre identiques!"), backgroundColor: kVioletColor)
          );
        } else {
          if (password1.length < 6){
            //Le mot de passe contient au moins 6 lettres
            globalKey.currentState.showSnackBar(
                SnackBar(content: WidgetSnackBarText("Le mot de passe doit contenir au moins 6 lettres!"), backgroundColor: kVioletColor,)
            );
          } if (_checkbox == false){
            //n'a pas accepté la reglementation
            globalKey.currentState.showSnackBar(
                SnackBar(content: WidgetSnackBarText("Vous devez accepter la règlementation!"), backgroundColor: kVioletColor,)
            );
          } else {
            try {
              _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password1);
              Navigator.pushNamed(context, PageHome.getPageName());
            } on FirebaseAuthException catch (e) {
              if (e.code == 'email-already-in-use') {
                globalKey.currentState.showSnackBar(
                    SnackBar(content: WidgetSnackBarText("Cet email est déjà utilisé!"), backgroundColor: kVioletColor,));
              }
            } catch (e) {
              print(e);
            }
          }
          }
        }
    } else {
      if ((name?.isEmpty ?? true) || (email?.isEmpty ?? true) || (password1?.isEmpty ?? true) || (password2?.isEmpty ?? true)) {
        //L'utilisateur n'a pas rempli tous les champs
        globalKey.currentState.showSnackBar(
            SnackBar(content: WidgetSnackBarText("Vous devez remplir tous les champs!"), backgroundColor: kVioletColor,)
        );
      }
    };
  }

  ListTile WidgetCheckBox() {
    return ListTile(
      leading: Transform.scale(
        scale: 0.75,
        child: Checkbox(
          onChanged: (value) {
            setState(() {
              _checkbox = !_checkbox;
            });
          },
          value: _checkbox,
          checkColor: kVioletColor,
          activeColor: Colors.white,
        ),
      ),
      title: Text(
        'J’accepte la réglemation et je souhaite poursuivre',
        style: kSignUpLabelTextStyle,
      ),
    );
  }

  Container DateInput(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
      padding: EdgeInsets.only(left: 10.0),
      child: ListTile(
        trailing: Icon(
          Icons.calendar_today,
          color: kVioletColor,
        ),
        title: TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2000, 1, 1),
                  maxTime: DateTime(2020, 12, 31), onConfirm: (date) {
                setState(() {
                  List<String> ls;
                  birthDay = date.toString();
                  ls = birthDay.split(' ');
                  birthDay = ls[0];
                  birthDay = birthDay.split('-').reversed.join('-');
                });
              },
                  currentTime: DateTime.utc(2020, 12, 31, 23, 00, 00),
                  locale: LocaleType.fr);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                birthDay,
                style: kSignUpTextFieldStyle,
              ),
            )),
      ),
    );
  }
}
