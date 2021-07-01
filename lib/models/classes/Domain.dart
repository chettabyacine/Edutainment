import 'DomainNames.dart';
import 'package:flutter/material.dart';

class Domain {
  DomainNames _name;
  Color _colour;
  List<dynamic> _levels;
  int _currentLevel;

  Domain(
      {DomainNames name,
      Color colour,
      List<dynamic> levels,
      @required int currentLevel}) {
    this._name = name;
    this._colour = colour;
    this._levels = levels;
    this._currentLevel = currentLevel;
  }

  void incrementLevelIndex() {
    if (this._levels.length - 1 > _currentLevel) {
      this._currentLevel++;
    }
  }

  List<dynamic> getlevels() {
    return this._levels;
  }

  void setlevels(List<dynamic> levels) {
    this._levels = levels;
  }

  int getcurrentlevel() {
    return this._currentLevel;
  }

  void setcurrentlevel(int currentlevel) {
    this._currentLevel = currentlevel;
  }

  Color getcolour() {
    return this._colour;
  }

  void setcolour(Color colour) {
    this._colour = colour;
  }

  DomainNames getname() {
    return this._name;
  }

  void setname(DomainNames name) {
    this._name = name;
  }
}
