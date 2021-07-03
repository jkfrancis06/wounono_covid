

import 'package:intl/intl.dart';

dateFromTimeStamp(int timestamp){
  var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp*1000);
  var format = DateFormat('dd-MM-yyyy HH:mm');
  return format.format(date);
}