import 'dart:ffi';

class CountryInfo {
  final int _id;
  final String iso2;
  final String iso3;
  final Double lat;
  final Double long;
  final String flag;

  CountryInfo(this._id, this.iso2, this.iso3, this.lat, this.long, this.flag);
}