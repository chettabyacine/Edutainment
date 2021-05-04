import 'package:edutainment/widgets/WidgetActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../utils/constants.dart';
import '../../utils/theme_constants.dart';
import 'local_widgets/WidgetAppBar.dart';
import '../log_in/page.dart';
import '../home/page.dart';
import 'local_widgets/WidgetInputSignUp.dart';
import 'package:edutainment/widgets/WidgetFooterPasswordForgot.dart';
import 'package:edutainment/widgets/WidgetFooterText.dart';
import 'local_widgets/ClassUser.dart';

class PageSignUp extends StatefulWidget {
  static const String _pageName = kPageNameMenu1;
  static String getPageName() {
    return _pageName;
  }

  @override
  _PageSignUpState createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  String name, email, password1, password2;
  String birthDay = 'Date de naissance';
  bool _checkbox = false;
  SignUpUser user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBarWidget(
              height: 170.0,
              logo: SvgPicture.asset('assets/bird.svg'),
              title: kProjectName,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  InputWidget(
                    data: name,
                    icon: Icons.person,
                    label: 'Nom Prénom',
                  ),
                  DateInput(context),
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
                    child: WidgetCheckBox(),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Opération d'inscription (Traitement en BDD)
                      user = SignUpUser(
                        name: name,
                        birthDay: birthDay,
                        email: email,
                        password1: password1,
                        password2: password2,
                      );
                      Navigator.pushNamed(context, PageHome.getPageName());
                    },
                    child: WidgetActionButton(
                      text: 'S\'inscrire',
                      destination: PageHome.getPageName(),
                      isFilled: true,
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
