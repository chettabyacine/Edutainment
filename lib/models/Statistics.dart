import 'DomainNames.dart';
class Statistics{
   Map<DateTime, int> _calculs;
   Map<DateTime, int> _geometry;
   Map<DateTime, int> _animals;
   Map<DateTime, int> all;

    Map<DateTime, int> domain(DomainNames name) {
     if (name == DomainNames.calculs)
       return this._calculs;
     if (name == DomainNames.geometry)
       return this._geometry;
     if (name == DomainNames.animals)
       return this._animals;

     return null;
   }

    Map<DateTime, int> getCalculs() {
     return this._calculs;
   }

    void setCalculs(Map<DateTime, int> calculs) {
     this._calculs = calculs;
   }

   Map<DateTime, int> getGeometry() {
     return this._geometry;
   }

    void setGeometry(Map<DateTime, int> geometry) {
     this._geometry = geometry;
   }

    Map<DateTime, int> getAnimals() {
     return this._animals;
   }

    void setAnimals(Map<DateTime, int> animals) {
     this._animals = animals;
   }

    Map<DateTime, int> getAll() {
     return this.all;
   }

    void setAll(Map<DateTime, int> all) {
     this.all = all;
   }
}