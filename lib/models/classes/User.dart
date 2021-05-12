import 'Domain.dart';
import 'Statistics.dart';
class User {
   int _id;
   String _name;
   String _emailString;
   String _password;
   int _globalRank;
   List<Domain> _domains;
  DateTime _birthDate;
   DateTime _signUpDate;
   Statistics _statistics;
   bool _private;

  User(int id, String name, String emailString, String password, int globalRank, DateTime birthDate , DateTime signUpDate,
   List<Domain> domains, String birthdate , Statistics statistics , bool prive ) {
    this._id = id;
    this._name = name;
    this._emailString = emailString;
    this._password = password;
    this._globalRank = globalRank;
    this._domains = domains;
    this._birthDate = birthDate;
    this._signUpDate= signUpDate;
    this._statistics = statistics ;
    this._private = prive ;
  }

  int getId(int Id ) {
    return this._id;
  }

  void setId(int id) {
    this._id = id;
  }

  String getname(String name ) {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  String getEmailString() {
    return this._emailString;
  }

  void setEmailString(String  emailString) {
    this._emailString = emailString;
  }

  String getPassword() {
    return this._password;
  }

  void setPassword(String password ) {
    this._password = password ;
  }

  int getGlobalRank() {
    return this._globalRank;
  }

  void setGlobalRank(int globalRank) {
    this._globalRank = globalRank;
  }

  DateTime getBirthDate() {
    return this._birthDate;
  }

  void setBirthDate(DateTime birthDate) {
    this._birthDate = birthDate;
  }

  Statistics getStatistics() {
    return _statistics;
  }

  void setStatistics(Statistics statistics) {
    this._statistics = statistics;
  }

  bool isPrivate() {
    return _private;
  }

  void setPrivate(bool private) {
    this._private = private;
  }
  void chooseDomain(){

  }
  void Deconnexion(){

  }
  void Synchroniser(){

  }
}
