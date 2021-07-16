import 'DomainNames.dart';

class Statistics {
  Map<DateTime, int> calculs;
  Map<DateTime, int> geometry;
  Map<DateTime, int> animals;
  Map<DateTime, int> all;

  Map<DateTime, int> domainByIndex(int index) {
    if (index == 1) return this.calculs;
    if (index == 2) return this.geometry;
    if (index == 3) return this.animals;
    if (index == 4) return this.all;
    return null;
  }

  Statistics({this.animals, this.geometry, this.calculs, this.all});

  Map<DateTime, int> domainByName(DomainNames name) {
    if (name == DomainNames.calculs) return this.calculs;
    if (name == DomainNames.geometry) return this.geometry;
    if (name == DomainNames.animals) return this.animals;

    return null;
  }
}
