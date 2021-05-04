import 'package:flutter/material.dart';
import '../../../utils/theme_constants.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  String data;
  final String label;
  final IconData icon;

  InputWidget({this.data, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
      child: ListTile(
        trailing: Icon(
          icon,
          color: kVioletColor,
        ),
        title: TextField(
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.start,
          keyboardType:
              label == 'Adresse email' ? TextInputType.emailAddress : null,
          textCapitalization: label == 'Nom Prénom'
              ? TextCapitalization.words
              : TextCapitalization.none,
          obscureText:
              (label == 'Mot de passe' || label == 'Confirmer mot de passe')
                  ? true
                  : false,
          onChanged: (value) {
            data = value;
          },
          style: kSignUpTextFieldStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: label),
        ),
      ),
    );
  }
}
