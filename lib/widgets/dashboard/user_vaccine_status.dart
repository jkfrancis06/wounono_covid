import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wounono_covid/models/healthStatus.dart';
import 'package:wounono_covid/utils/constants.dart';

class UserVaccineStatus extends StatelessWidget {


   @override
   Widget build(BuildContext context) {


     return Stack(
       children: [
         Container(
           width: MediaQuery.of(context).size.width * 0.90,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(8.0),
           ),
           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Wrap(
                       children: [
                         Text(
                           "Statut :",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                             color: Color.fromRGBO(74, 77, 84, 0.7),
                           ),
                         ),
                         SizedBox(
                           width: 4.0,
                         ),
                         Text(
                           "--",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                             color: Color.fromRGBO(19, 22, 33, 1),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 5.0,
                     ),
                     Wrap(
                       children: [
                         Text(
                           "Vaccin :",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                             color: Color.fromRGBO(74, 77, 84, 0.7),
                           ),
                         ),
                         SizedBox(
                           width: 4.0,
                         ),
                         Text(
                           "--",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 5.0,
                     ),
                     Wrap(
                       children: [
                         Text(
                           "Nombre de doses :",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                             color: Color.fromRGBO(74, 77, 84, 0.7),
                           ),
                         ),
                         SizedBox(
                           width: 4.0,
                         ),
                         Text(
                           "--",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 5.0,
                     ),
                     Wrap(
                       children: [
                         Text(
                           "Date derniere dose :",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                             color: Color.fromRGBO(74, 77, 84, 0.7),
                           ),
                         ),
                         SizedBox(
                           width: 4.0,
                         ),
                         Text(
                           "--",
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1
                               .copyWith(
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 width: ScreenUtil().setWidth(10.0),
               ),
               Container(
                 width: ScreenUtil().setWidth(80.0),
                 height: ScreenUtil().setHeight(80.0),
                 child: Image.asset(
                     "assets/images/qr_code_gray.png"
                 ),
               ),

             ],
           ),
         ),
         Positioned.fill(
             child: new Material(
                 color: Colors.transparent,
                 child: new InkWell(
                   borderRadius: BorderRadius.circular(11.0),
                   onTap: () => {
                     print('Statut vaccinal')
                   },
                 )
             )
         )
       ],
     );



   }

   String _getQrImage(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'assets/images/qr_code_green.png';
       case TestResult.TEST_POS:
         return 'assets/images/qr_code_red.png';
       default:
         return 'assets/images/qr_code_gray.png';
     }
   }

   _getResultColor(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return Constants.primaryColor;
       case TestResult.TEST_POS:
         return Colors.red;
       default:
         return Colors.black;
     }
   }

   String _getResultString(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'Négatif';
       case TestResult.TEST_POS:
         return 'Positif';
       default:
         return '---';
     }
   }
 }




