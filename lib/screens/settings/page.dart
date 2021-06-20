import 'package:edutainment/screens/entry_point/page.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import '../../widgets/WidgetAppBarDomain.dart';
import 'package:edutainment/screens/home/page.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edutainment/screens/home/page.dart';

class PageSettings extends StatefulWidget {
  static const String _pageName = kPageSettings;

  @required
  String email;
  String nom;
  String prenom;
  Color profile;
  PageSettings({this.email,this.nom,this.prenom,this.profile});


  static String getPageName() {
    return _pageName;
  }

  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSwitched1=false;
  bool isSwitched2=false;
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageHome()),
          );
          break;
        case 1:
        //TODO: Go to ranks page
          break;
        case 2:
        //TODO: Go to settings page
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageSettings(email: 'ji_hamouda@esi.dz',prenom: 'Ilyes',nom: 'Hamouda',profile: Colors.green,)),
          );
          break;
        default:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,color: Colors.black,size: 40.0,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageHome()),
                    );
                  },
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Text('${widget.prenom[0]}${widget.nom[0]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),),
                      backgroundColor: widget.profile,
                      maxRadius: 30.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${widget.prenom} ${widget.nom}',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text( '${widget.email}',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey[600],
                    ),),
                  ],
                ),
              ),
              SizedBox(
                  height : 25.0,
                  ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20 ),
                width: double.infinity,
                color: Color(0xFFC4C4C4),
                child: Text(
                  'MODIFIER PROFILE',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextButton(
                    onPressed: () {  }, //TODO: CHANGE PASSWORD
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.lock_open,
                          color: Colors.black,
                          size: 23,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 203,
                        ),
                        Icon(Icons.arrow_forward_ios,color: Colors.black,size: 23,),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20 ),
                width: double.infinity,
                color: Color(0xFFC4C4C4),
                child: Text(
                  'APPLICATION',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 23,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Synchroniser le compte',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 56,
                    ),
                    Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          isSwitched1 = value;
                          print(isSwitched1);
                        });
                      },
                      activeTrackColor: Colors.blue,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.screen_share_outlined,
                      color: Colors.black,
                      size: 23,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Compte privé',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      width: 153,
                    ),
                    Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          isSwitched2 = value;
                          print(isSwitched2);
                        });
                      },
                      activeTrackColor: Colors.blue,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {  }, //TODO : SINGALER PROBLEME
                  child: Row(
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      Icon(
                        Icons.report_gmailerrorred_outlined,
                        color: Colors.black,
                        size: 23,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Signaler un problème',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: LogOutDialog, //TODO : LOGOUT FROM THE ACCOUNT
                  child: Row(
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 23,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Déconnexion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: TextButton(
                      onPressed: () {  }, //TODO: DELETE THE ACCOUNT
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 23,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Text(
                              'Supprime définitivement mon compte',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey[500],
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFF3347FF),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon rank.svg'),
              label: 'Rang',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icon stats.svg'),
              label: 'Statistiques',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings ,color: Colors.grey[500],),
              label: 'Paramètres',
              activeIcon: Icon(Icons.settings , color: Color(0xFF3347FF),),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF3347FF),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  Future<void> LogOutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user can dissmiss when clicking outside the dialog box
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Déconnexion', style: kDialogTitleStyle,),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("En cliquant sur 'ok' vous allez vous déconnecter de votre compte", style: kDialogContentStyle,),
                Text('Êtes-vous sûr de vouloir quitter?', style: kDialogContentStyle,),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok', style: TextStyle(color: kWhiteColor, fontFamily: 'Open Sans'),),
              onPressed: () async {
                //Log Out
                _auth.signOut();
                Navigator.pushNamed(context, PageEntryPoint.getPageName());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kVioletColor)
              ),
            ),
            TextButton(
              child: const Text('annuler   ', style: TextStyle(color: kVioletColor, fontFamily: 'Open Sans'),),
              onPressed: () {
                Navigator.pop(context, 'annuler');
              },
            ),
          ],
        );
      },
    );
  }
}
