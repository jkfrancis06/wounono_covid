
import 'package:number_display/number_display.dart';

numberDisplay(data){

  final display = createDisplay(
      length: 5,
      decimal: 0
  );
  print(display(data));
  return display(data);
}